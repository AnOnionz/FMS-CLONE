import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/config/domain/entities/config.dart';
import 'package:fms/features/work_place/domain/usecases/params.dart';

import '../../data/repositories/config_repository_impl.dart';

class GetConfigUsecase extends UseCase<ConfigEntity?, WorkPlaceParams> {
  final ConfigRepositoryImpl _appRepositoryImpl;

  GetConfigUsecase(this._appRepositoryImpl);
  @override
  Future<Result<ConfigEntity?>> call(WorkPlaceParams params) async {
    return _appRepositoryImpl.getConfigs(params.enitty);
  }
}
