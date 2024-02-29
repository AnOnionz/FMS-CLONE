import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import '/core/constant/type_def.dart';
import '/core/errors/app_exception.dart';
import '/core/mixins/fx.dart';
import '/core/usecase/either.dart';

/// 	Try an action
/// 	return Result<Type>
///
///  If exception will be return failure,
///  on finally will be call if it isn't null
Future<Result<T>> todo<T>(Function0<Future<Result<T>>> action,
    {Function? onFinally}) async {
  try {
    return await action.call();
  } on AppException catch (_) {
    _printException(_);
    debugPrintStack(stackTrace: _.stackTrace);
    return Left(_.failure);
  } catch (e, s) {
    final exception = UnknowException(e, s);
    _printException(exception);
    debugPrintStack(stackTrace: s);
    return Left(exception.failure);
  } finally {
    onFinally?.call();
  }
}

void _printException(AppException e) {
  String line(String text, String fill) {
    final fillCount =
        (e.message ?? 25.generate((index) => index).toString()).length -
            text.length;
    final left = List.filled(fillCount ~/ 2, fill);
    final right = List.filled(fillCount - left.length, fill);
    return left.join() + text + right.join();
  }

  developer.log('\x1B[33m' '╔${line('', '═')}╗' '\x1B[0m');
  developer.log('\x1B[33m' '║${line('${e.runtimeType}', ' ')}║' '\x1B[0m');
  developer.log('\x1B[33m' '╟${line('⇑', '─')}╢' '\x1B[0m');
  developer
      .log('\x1B[33m' '║${line('${e.error.runtimeType}', ' ')}║' '\x1B[0m');
  developer.log('\x1B[33m' '╟${line('⇑', '─')}╢' '\x1B[0m');
  developer.log('\x1B[33m'
      '║${line(e.error.toString().replaceAll('${e.error.runtimeType}', '').replaceAll('\n', ' '), ' ')}║'
      '\x1B[0m');
  developer.log('\x1B[33m' '╚${line('', '═')}╝' '\x1B[0m');
}
