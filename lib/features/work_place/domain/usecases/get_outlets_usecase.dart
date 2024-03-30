import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fms/features/work_place/domain/usecases/params.dart';

import '../../data/repositories/work_place_repository_impl.dart';

class GetOutletsUsecase extends UseCase<List<OutletEntity>, WorkPlaceParams> {
  final WorkPlaceRepositoryImpl _appRepositoryImpl;

  GetOutletsUsecase(this._appRepositoryImpl);
  @override
  Future<Result<List<OutletEntity>>> call(WorkPlaceParams params) async {
    return _appRepositoryImpl.getOutletsOfProject(params.enitty);
  }
}
