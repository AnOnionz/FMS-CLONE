import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/services/connectivity/connectivity_service.dart';
import '../errors/failure.dart';
import '/core/constant/type_def.dart';
import '/core/errors/app_exception.dart';
import '/core/usecase/either.dart';

abstract class Repository {
  final ConnectivityService _connectivityService = Modular.get();

  /// 	Try an action
  /// 	return Result<Type>
  ///
  ///  If exception will be return failure,
  ///  on finally will be call if it isn't null
  Future<Result<T>> todo<T>(Function0<Future<Result<T>>> action,
      {void Function()? onFinally,
      void Function(Failure failure)? onFailure,
      bool useInternet = false}) async {
    try {
      if (useInternet && !_connectivityService.hasConnected) {
        throw InternetException('intenet status disconnected', null, null);
      } else {
        return await action.call();
      }
    } on AppException catch (_) {
      Fx.logException(_);
      onFailure?.call(_.failure);
      return Left(_.failure);
    } catch (e, s) {
      final exception = UnknowException(e, s);
      Fx.logException(exception);
      onFailure?.call(exception.failure);
      return Left(exception.failure);
    } finally {
      onFinally?.call();
    }
  }
}
