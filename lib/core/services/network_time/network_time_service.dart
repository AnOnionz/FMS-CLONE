import 'dart:async';
import 'dart:io';

import 'package:fms/core/errors/app_exception.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../mixins/common.dart';
import '../../utilities/isolate_async.dart';
import '../../utilities/ntp_message.dart';

final class NetworkTimeService {
  NetworkTimeRunner? _runner;
  NetworkTimeRunner get runner {
    final currentRunner = _runner;
    if (currentRunner == null) {
      throw Exception('Network time service not started');
    }
    if (currentRunner._isolateAsync.isTerminated) {
      throw Exception('Network time service already shutdown');
    }
    return currentRunner;
  }

  bool get isRunning => _runner?._isolateAsync.isTerminated == false;

  bool _isStarting = false;

  NetworkTimeService();

  Future<bool> startup({
    String? lookUpAddress,
    String? locationName,
    Duration? timeout,
  }) async {
    final currentRunner = _runner;
    if (currentRunner != null && !currentRunner._isolateAsync.isTerminated) {
      throw Exception('Network time service already started');
    }

    if (_isStarting) {
      throw Exception('Network time service already starting');
    }

    _isStarting = true;

    final isolateAsync =
        await IsolateAsync.spawn<NetworkTimeAction, NetworkTimeOptions>(
      NetworkTimeRunner._entryPoint,
      NetworkTimeOptions(
        lookUpAddress: lookUpAddress,
        locationName: locationName,
        timeout: timeout,
      ),
      debugName: 'NetworkTimeService',
      onError: (dynamic error) {
        assert(() {
          Fx.log(
            'An error occurred while running the network time service.' +
                error.toString(),
          );
          return true;
        }());
      },
    );

    _runner = NetworkTimeRunner._(isolateAsync);

    _isStarting = false;

    return !isolateAsync.isTerminated;
  }

  Future<void> shutdown() async {
    runner._isolateAsync.shutdown();
  }
}

final class NetworkTimeOptions {
  final String? lookUpAddress;
  final String? locationName;
  final Duration? timeout;

  NetworkTimeOptions({this.lookUpAddress, this.locationName, this.timeout});
}

final class NetworkTimeRunner {
  final IsolateAsync _isolateAsync;

  NetworkTimeRunner._(this._isolateAsync);

  /// Retrieves the current network time.
  Future<DateTime> now() async {
    return _isolateAsync.send<DateTime>(NetworkTimeAction.now);
  }

  /// Refreshes the network time by fetching the current time from the server.
  Future<bool> refresh() async {
    return _isolateAsync.send<bool>(NetworkTimeAction.refresh);
  }

  @pragma('vm:entry-point')
  static Future<void> _entryPoint(
    Stream<IsolateAsyncTransmission<NetworkTimeAction>> transmission,
    NetworkTimeOptions options,
  ) async {
    tz.initializeTimeZones();
    final location = tz.getLocation(options.locationName ?? 'Asia/Ho_Chi_Minh');

    Future<DateTime> fetchAccurateTime() async {
      final ntpMessage = await NetworkTimeRunner._getRawNtpMessage(
        lookUpAddress: options.lookUpAddress ?? 'time.google.com',
        timeout: options.timeout ?? const Duration(seconds: 6),
      );
      return tz.TZDateTime.from(
        NetworkTimeRunner._timestampToDateTime(ntpMessage.referenceTimestamp),
        location,
      );
    }

    DateTime networkTime = await fetchAccurateTime();
    final stopwatch = Stopwatch();
    stopwatch.start();

    transmission.listen((event) async {
      switch (event.data) {
        case NetworkTimeAction.now:
          event.reply(networkTime.add(stopwatch.elapsed));
          break;
        case NetworkTimeAction.refresh:
          try {
            networkTime = await fetchAccurateTime();
            stopwatch.reset();
            event.reply(true);
          } catch (e) {
            event.reply(false);
          }
          break;
      }
    });
  }

  @pragma('vm:entry-point')
  static DateTime _timestampToDateTime(double timestamp) {
    if (timestamp == 0) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    final double utc = timestamp - 2208988800.0;
    final double ms = utc * 1000.0;
    return DateTime.fromMillisecondsSinceEpoch(ms.toInt());
  }

  @pragma('vm:entry-point')
  static Future<NTPMessage> _getRawNtpMessage({
    String lookUpAddress = 'time.google.com',
    int port = 123,
    DateTime? localTime,
    Duration? timeout,
  }) async {
    final List<InternetAddress> addresses =
        await InternetAddress.lookup(lookUpAddress);

    if (addresses.isEmpty) {
      return Future.error('Could not resolve address for $lookUpAddress.');
    }

    final InternetAddress serverAddress = addresses.first;
    InternetAddress clientAddress = InternetAddress.anyIPv4;
    if (serverAddress.type == InternetAddressType.IPv6) {
      clientAddress = InternetAddress.anyIPv6;
    }

    // Init datagram socket to anyIPv4 and to port 0
    final RawDatagramSocket datagramSocket =
        await RawDatagramSocket.bind(clientAddress, 0);

    final NTPMessage senderNtpMessage = NTPMessage();
    final List<int> buffer = senderNtpMessage.toByteArray();
    final DateTime time = localTime ?? DateTime.now();
    senderNtpMessage.encodeTimestamp(buffer, 40,
        (time.millisecondsSinceEpoch / 1000.0) + senderNtpMessage.timeToUtc);

    // Send buffer packet to the address [serverAddress] and port [port]
    datagramSocket.send(buffer, serverAddress, port);
    // Receive packet from socket
    Datagram? packet;

    bool receivePacket(RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        packet = datagramSocket.receive();
      }
      return packet != null;
    }

    try {
      if (timeout != null) {
        await datagramSocket.timeout(timeout).firstWhere(receivePacket);
      } else {
        await datagramSocket.firstWhere(receivePacket);
      }
    } catch (e, s) {
      Fx.logException(UnknowException(e, s));
      rethrow;
    } finally {
      datagramSocket.close();
    }

    if (packet == null) {
      return Future<NTPMessage>.error('Received empty response.');
    }

    final NTPMessage receivedNtpMessage = NTPMessage(packet!.data);
    return receivedNtpMessage;
  }
}

/// The actions that can be performed on the network time.
enum NetworkTimeAction {
  // Retrieves the current network time.
  now,

  /// Refreshes the network time by fetching the current time from the server.
  refresh,
}
