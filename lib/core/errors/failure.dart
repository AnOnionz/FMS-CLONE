abstract class Failure {
  final String? _message;
  final Object? _error;
  final StackTrace? _stackTrace;

  const Failure(this._message, this._error, this._stackTrace);

  String? get message => _message;

  Object? get error => _error;

  StackTrace? get stackTrace => _stackTrace;

  @override
  String toString() =>
      '$runtimeType{message: $_message, error: $_error, stackTrace: $_stackTrace}';
}

class UnknowFailure extends Failure {
  const UnknowFailure(Object? error, StackTrace? stackTrace)
      : super(null, error, stackTrace);
}

class InternalFailure extends Failure {
  const InternalFailure(String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure(
      String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}

class UpdateAppRequiredFailure extends Failure {
  const UpdateAppRequiredFailure(
      String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}

class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure(
      String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}

class SocketFailure extends Failure {
  const SocketFailure(String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(
      String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}

class ServerDownFailure extends Failure {
  const ServerDownFailure(
      String? message, Object? error, StackTrace? stackTrace)
      : super(message, error, stackTrace);
}
