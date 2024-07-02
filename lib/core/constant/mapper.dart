import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/mixins/extension/string_ext.dart';

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

  static TextInputType dataTypeToInputType({required String dataType}) {
    switch (dataType) {
      case 'string':
        return TextInputType.text;
      case 'email':
        return TextInputType.emailAddress;
      case 'number' || 'phoneNumber':
        return TextInputType.number;

      default:
        return TextInputType.text;
    }
  }

  static ValidateField? dataTypeToValidate({required String dataType}) {
    switch (dataType) {
      case 'email':
        return (String? value) {
          // The regular expression pattern to match email addresses
          final RegExp regex = RegExp(
              r'^[_A-Za-z0-9-+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})\$*(\s?)');

          // Check if the email format matches the regular expression
          if (value.isNotEmptyAndNotNull && !regex.hasMatch(value!)) {
            return 'Email chưa chính xác';
          }

          // If the email is valid, return null (no error message)
          return null;
        };
      case 'phoneNumber':
        return (String? value) {
          final RegExp regex =
              RegExp(r'(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b');

          // Check if the phone format matches the regular expression
          if (value.isNotEmptyAndNotNull && !regex.hasMatch(value!)) {
            return 'Số điện thoại chưa chính xác';
          }
          // If the phone is valid, return null (no error message)
          return null;
        };

      case 'cccd':
        return (String? value) {
          final RegExp regex = RegExp(r'^(?=[0-9]+$)(?:.{9}|.{12})+$');

          if (value.isNotEmptyAndNotNull && !regex.hasMatch(value!)) {
            return 'CMND/CCCD chưa chính xác';
          }
          return null;
        };

      default:
        return null;
    }
  }
}
