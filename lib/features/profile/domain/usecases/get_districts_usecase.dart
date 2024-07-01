import 'package:fms/core/usecase/usecase.dart';

import '../../../../core/constant/type_def.dart';
import '../../../work_place/domain/entities/outlet_entity.dart';
import '../../data/repositories/profile_repository_impl.dart';

class GetDistrictsUsecase extends UseCase<List<District>, int> {
  final ProfileRepositoryImpl _repository;

  GetDistrictsUsecase(this._repository);
  @override
  Future<Result<List<District>>> call(int params) async {
    return _repository.getDistricts(provinceId: params);
  }
}
