import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/domain/usecases/params.dart';

import '../../data/repositories/work_place_repository_impl.dart';

class GetBoothsUsecase extends UseCase<List<BoothEntity>, WorkPlaceParams> {
  final WorkPlaceRepositoryImpl _appRepositoryImpl;

  GetBoothsUsecase(this._appRepositoryImpl);
  @override
  Future<Result<List<BoothEntity>>> call(WorkPlaceParams params) async {
    return _appRepositoryImpl.getBoothsOfOutlet(params.enitty);
  }
}
