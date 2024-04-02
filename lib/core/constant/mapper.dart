import '/core/errors/app_exception.dart';

import '/core/errors/failure.dart';

final class Mapper {
  static Failure errorToFailure(Object e, StackTrace? s) {
    return switch (e.runtimeType) {
      InternetException => SocketFailure(
          message: (e as InternetException).message,
          error: e.error,
          stackTrace: e.stackTrace),
      ServerDownException => ServerDownFailure(
          message: (e as ServerDownException).message,
          error: e.error,
          stackTrace: e.stackTrace),
      BadRequestException => BadRequestFailure(
          message: (e as BadRequestException).message,
          error: e.error,
          stackTrace: e.stackTrace),
      InternalException => InternalFailure(
          message: (e as InternalException).message,
          error: e.error,
          stackTrace: e.stackTrace),
      NotFoundException => NotFoundFailure(
          message: (e as NotFoundException).message,
          error: e.error,
          stackTrace: e.stackTrace),
      TimeoutException => RequestTimeoutFailure(
          message: (e as TimeoutException).message,
          error: e.error,
          stackTrace: e.stackTrace),
      UnAuthorizedException => UnAuthenticatedFailure(
          message: (e as UnAuthorizedException).message,
          error: e.error,
          stackTrace: e.stackTrace),
      UnknowException =>
        UnknowFailure((e as UnknowException).error, e.stackTrace),
      _ => UnknowFailure(e, s),
    };
  }
}
