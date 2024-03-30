import 'package:fms/core/mixins/common.dart';
import '/core/constant/type_def.dart';
import '/core/errors/app_exception.dart';
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
    Fx.logException(_);

    return Left(_.failure);
  } catch (e, s) {
    final exception = UnknowException(e, s);
    Fx.logException(exception);

    return Left(exception.failure);
  } finally {
    onFinally?.call();
  }
}
