import 'package:fms/core/usecase/usecase.dart';

import '../../../../core/constant/type_def.dart';
import '../../../work_place/domain/entities/outlet_entity.dart';
import '../../data/repositories/profile_repository_impl.dart';

class GetWardsUsecase extends UseCase<List<Ward>, GetWardsParams> {
  final ProfileRepositoryImpl _repository;

  GetWardsUsecase(this._repository);
  @override
  Future<Result<List<Ward>>> call(GetWardsParams params) async {
    return _repository.getWards(
        provinceId: params.provinceId, districtId: params.districtId);
  }
}

class GetWardsParams extends Params {
  final int provinceId;
  final int districtId;

  GetWardsParams({required this.provinceId, required this.districtId});
}
