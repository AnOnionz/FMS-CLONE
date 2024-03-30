import 'dart:async';
import 'dart:isolate';

import 'package:fms/core/mixins/common.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../utilities/isolate_async.dart';

final class InternetConnectionService {
  InternetConnectionRunner? _runner;
  InternetConnectionRunner get runner {
    final currentRunner = _runner;
    if (currentRunner == null) {
      throw Exception('Internet connection service not started');
    }
    if (currentRunner._isolateAsync.isTerminated) {
      throw Exception('Internet connection service already shutdown');
    }
    return currentRunner;
  }

  bool get isRunning => _runner?._isolateAsync.isTerminated == false;

  bool _isStarting = false;

  InternetConnectionService();

  Future<bool> startup({
    Duration? checkTimeout,
    Duration? checkInterval,
  }) async {
    final currentRunner = _runner;
    if (currentRunner != null && !currentRunner._isolateAsync.isTerminated) {
      throw Exception('Internet connection service already started');
    }

    if (_isStarting) {
      throw Exception('Internet connection service already starting');
    }

    _isStarting = true;

    final isolateAsync = await IsolateAsync.spawn(
      InternetConnectionRunner._entryPoint,
      InternetConnectionOptions(
        checkTimeout: checkTimeout,
        checkInterval: checkInterval,
      ),
      debugName: 'InternetConnectionService',
      errorsAreFatal: true,
      onError: (dynamic error) {
        assert(() {
          Fx.log(
            'An error occurred while running the internet connection service.' +
                error.toString(),
          );
          return true;
        }());
      },
    );

    _runner = InternetConnectionRunner._(isolateAsync);

    _isStarting = false;

    return !isolateAsync.isTerminated;
  }

  Future<void> shutdown() async {
    runner._isolateAsync.shutdown();
  }
}

final class InternetConnectionOptions {
  final Duration? checkTimeout;
  final Duration? checkInterval;

  InternetConnectionOptions({this.checkTimeout, this.checkInterval});
}

final class InternetConnectionRunner {
  final IsolateAsync _isolateAsync;
  final _streamController = StreamController<bool>.broadcast();

  InternetConnectionRunner._(this._isolateAsync) {
    final rawReceivePort = RawReceivePort();
    final receivePort = ReceivePort();
    rawReceivePort.handler = (dynamic message) {
      _streamController.close();
      rawReceivePort.close();
      receivePort.close();
    };
    receivePort.listen((message) {
      if (message is InternetConnectionStatus) {
        _streamController.sink.add(
          message == InternetConnectionStatus.connected,
        );
      }
    });
    _isolateAsync.isolate.addOnExitListener(rawReceivePort.sendPort);
    _isolateAsync.send(receivePort.sendPort);
  }

  Stream<bool> get onConnectedChange => _streamController.stream;

  Future<bool> get hasConnection => _isolateAsync.send(null);

  @pragma('vm:entry-point')
  static Future<void> _entryPoint(
    Stream<IsolateAsyncTransmission> transmission,
    InternetConnectionOptions options,
  ) async {
    final connectionChecker = InternetConnectionChecker.createInstance(
      checkTimeout:
          options.checkTimeout ?? InternetConnectionChecker.DEFAULT_TIMEOUT,
      checkInterval:
          options.checkInterval ?? InternetConnectionChecker.DEFAULT_INTERVAL,
    );

    transmission.listen((event) async {
      final data = event.data;
      if (data is SendPort) {
        connectionChecker.onStatusChange.listen(data.send);
        event.reply(null);
      } else {
        final hasConnection = await connectionChecker.hasConnection;
        event.reply(hasConnection);
      }
    });
  }
}
