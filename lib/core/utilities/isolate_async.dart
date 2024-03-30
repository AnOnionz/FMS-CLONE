import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:uuid/uuid.dart';

final class IsolateAsync {
  final Isolate isolate;

  final Stream<IsolateAsyncData<dynamic>> _stream;
  final SendPort _sendPort;

  final _completerMap = <String, Completer<dynamic>>{};

  bool _isTerminated = false;
  bool get isTerminated => _isTerminated;

  IsolateAsync._(this.isolate, this._sendPort, this._stream) {
    _stream.listen(
      (IsolateAsyncData<dynamic> message) {
        if (_completerMap.containsKey(message._uuid)) {
          final completer = _completerMap[message._uuid]!;
          completer.complete(message.data);
          _completerMap.remove(message._uuid);
        }
      },
      onDone: () {
        for (final completer in _completerMap.values) {
          completer.completeError(IsolateAsyncError('Isolate has exited'));
        }
        _completerMap.clear();
        _isTerminated = true;
      },
    );
  }

  Future<T> send<T>(dynamic message) async {
    final uuid = const Uuid().v4();
    final completer = Completer<T>();
    _completerMap.addEntries([MapEntry(uuid, completer)]);
    _sendPort.send(IsolateAsyncData._(uuid, data: message));
    return completer.future;
  }

  void shutdown() {
    isolate.kill(priority: Isolate.immediate);
  }

  static Future<IsolateAsync> spawn<T, P>(
    Function(Stream<IsolateAsyncTransmission<T>> transmission, P options)
        entryPoint,
    P options, {
    bool paused = false,
    bool errorsAreFatal = true,
    Function(dynamic message)? onError,
    Function? onExit,
    String? debugName,
  }) async {
    final entryPointId =
        PluginUtilities.getCallbackHandle(entryPoint)?.toRawHandle();
    if (entryPointId == null) {
      throw IsolateAsyncError('Invalid entry point');
    }

    final uuid = const Uuid().v4();
    final completer = Completer<SendPort>();
    final streamController = StreamController<IsolateAsyncData<dynamic>>();
    final receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is IsolateAsyncData) {
        if (!completer.isCompleted && uuid == message._uuid) {
          completer.complete(message.data as SendPort);
        } else {
          streamController.sink.add(message);
        }
      }
    });

    final rawReceivePort = RawReceivePort();
    rawReceivePort.handler = (dynamic message) {
      // Isolate has exited
      if (message == null) {
        if (!completer.isCompleted) {
          completer.completeError(IsolateAsyncError('Isolate exited'));
        }
        streamController.close();
        rawReceivePort.close();
        receivePort.close();
        if (onExit != null) {
          onExit();
        }
      } else if (onError != null) {
        onError(message);
      }
    };

    final isolate = await Isolate.spawn(
      IsolateAsync._entryPoint<T>,
      IsolateAsyncTransmission._(
        uuid,
        data: IsolateAsyncHandshake._(
          entryPointId: entryPointId,
          options: options,
        ),
        sendPort: receivePort.sendPort,
      ),
      paused: paused,
      errorsAreFatal: errorsAreFatal,
      debugName: debugName,
      onError: rawReceivePort.sendPort,
      onExit: rawReceivePort.sendPort,
    );

    final sendPort = await completer.future;

    return IsolateAsync._(isolate, sendPort, streamController.stream);
  }

  @pragma('vm:entry-point')
  static void _entryPoint<T>(
    IsolateAsyncTransmission<IsolateAsyncHandshake<dynamic>> message,
  ) {
    final entryPoint = PluginUtilities.getCallbackFromHandle(
      CallbackHandle.fromRawHandle(message.data.entryPointId),
    );
    if (entryPoint == null) {
      throw IsolateAsyncError('Invalid entry point');
    }

    final receivePort = ReceivePort();
    final streamController = StreamController<IsolateAsyncTransmission<T>>();

    receivePort.cast<IsolateAsyncData<dynamic>>().listen((event) {
      streamController.sink.add(
        IsolateAsyncTransmission<T>._(
          event._uuid,
          data: event.data as T,
          sendPort: message._sendPort,
        ),
      );
    });

    entryPoint(streamController.stream, message.data.options);

    message.reply(receivePort.sendPort);
  }
}

final class IsolateAsyncHandshake<T> {
  final int entryPointId;
  final T options;

  IsolateAsyncHandshake._({required this.entryPointId, required this.options});
}

final class IsolateAsyncTransmission<T> {
  final String _uuid;
  final SendPort _sendPort;
  final T data;

  IsolateAsyncTransmission._(
    this._uuid, {
    required this.data,
    required SendPort sendPort,
  }) : _sendPort = sendPort;

  void reply(dynamic data) =>
      _sendPort.send(IsolateAsyncData._(_uuid, data: data));
}

final class IsolateAsyncData<T> {
  final String _uuid;
  final T data;

  IsolateAsyncData._(this._uuid, {required this.data});
}

final class IsolateAsyncError implements Exception {
  final String message;

  IsolateAsyncError(this.message);

  @override
  String toString() => message;
}
