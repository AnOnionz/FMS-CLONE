import 'package:equatable/equatable.dart';

import '/core/constant/mapper.dart';
import '/core/errors/failure.dart';

abstract class AppException extends Equatable implements Exception {
  final String? message;
  final Object error;
  final StackTrace stackTrace;

  const AppException._(
    this.message,
    this.error,
    this.stackTrace,
  );

  Failure get failure => Mapper.errorToFailure(this, stackTrace);

  @override
  String toString() {
    return '$runtimeType{message=$message, error=$error, stackTrace=$stackTrace';
  }

  @override
  List<Object?> get props => [message, error, stackTrace];
}

class UnknowException extends AppException {
  const UnknowException(Object error, StackTrace stackTrace)
      : super._(null, error, stackTrace);
}

class ServerDownException extends AppException {
  const ServerDownException(
      String? message, Object error, StackTrace stackTrace)
      : super._(message, error, stackTrace);
}

class BadRequestException extends AppException {
  const BadRequestException(
      String? message, Object error, StackTrace stackTrace)
      : super._(message, error, stackTrace);
}

class SocketException extends AppException {
  const SocketException(String? message, Object error, StackTrace stackTrace)
      : super._(message, error, stackTrace);
}

class InternalException extends AppException {
  const InternalException(String? message, Object error, StackTrace stackTrace)
      : super._(message, error, stackTrace);
}

class NotFoundException extends AppException {
  const NotFoundException(String? message, Object error, StackTrace stackTrace)
      : super._(message, error, stackTrace);
}

class TimeoutException extends AppException {
  const TimeoutException(String? message, Object error, StackTrace stackTrace)
      : super._(message, error, stackTrace);
}

class UnAuthorizedException extends AppException {
  const UnAuthorizedException(
      String? message, Object error, StackTrace stackTrace)
      : super._(message, error, stackTrace);
}
