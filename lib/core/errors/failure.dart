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

class MessageFailure extends Failure {
  const MessageFailure({String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class InternalFailure extends Failure {
  const InternalFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class UpdateAppRequiredFailure extends Failure {
  const UpdateAppRequiredFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class SocketFailure extends Failure {
  const SocketFailure({String? message, Object? error, StackTrace? stackTrace})
      : super('Kết nối mạng không ổn định, vui lòng kiểm tra lại kết nối mạng',
            error, stackTrace);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class ServerDownFailure extends Failure {
  const ServerDownFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class DataNullFailure extends Failure {
  const DataNullFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super('Không có dữ liệu', error, stackTrace);
}

class DownloadFailure extends Failure {
  const DownloadFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super('Kiểm tra lại đường truyền mạng và thử lại', error, stackTrace);
}

class RequiredSyncFailure extends Failure {
  const RequiredSyncFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(message, error, stackTrace);
}

class RequiredAllTaskDoneFailure extends Failure {
  const RequiredAllTaskDoneFailure(
      {String? message, Object? error, StackTrace? stackTrace})
      : super(
            'Yêu cầu hoàn thành tất cả công việc bắt buộc trong ngày trước khi chấm công ra',
            error,
            stackTrace);
}
