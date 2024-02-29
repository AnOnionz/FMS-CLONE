import '/core/errors/app_exception.dart';

import '/core/errors/failure.dart';

final class Mapper {
  static Failure errorToFailure(Object e, StackTrace s) {
    return switch (e) {
      SocketException =>
        SocketFailure((e as SocketException).message, e.error, e.stackTrace),
      ServerDownException => ServerDownFailure(
          (e as ServerDownException).message, e.error, e.stackTrace),
      BadRequestException => BadRequestFailure(
          (e as BadRequestException).message, e.error, e.stackTrace),
      InternalException => BadRequestFailure(
          (e as BadRequestException).message, e.error, e.stackTrace),
      NotFoundException => NotFoundFailure(
          (e as NotFoundException).message, e.error, e.stackTrace),
      TimeoutException => RequestTimeoutFailure(
          (e as TimeoutException).message, e.error, e.stackTrace),
      UnAuthorizedException => UnAuthenticatedFailure(
          (e as UnAuthorizedException).message, e.error, e.stackTrace),
      UnknowException =>
        UnknowFailure((e as UnknowException).error, e.stackTrace),
      _ => UnknowFailure(e, s),
    };
  }
}
