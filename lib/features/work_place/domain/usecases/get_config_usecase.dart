import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/work_place/domain/usecases/params.dart';

import '../../data/repositories/work_place_repository_impl.dart';

class GetConfigUsecase extends UseCase<void, WorkPlaceParams> {
  final WorkPlaceRepositoryImpl _appRepositoryImpl;

  GetConfigUsecase(this._appRepositoryImpl);
  @override
  Future<Result<void>> call(WorkPlaceParams params) async {
    return _appRepositoryImpl.getConfigs(params.enitty);
  }
}
