import 'package:fms/core/usecase/usecase.dart';

import '../../../../core/constant/type_def.dart';
import '../../../work_place/domain/entities/outlet_entity.dart';
import '../../data/repositories/profile_repository_impl.dart';

class GetProvincesUsecase extends UseCase<List<Province>, void> {
  final ProfileRepositoryImpl _repository;

  GetProvincesUsecase(this._repository);
  @override
  Future<Result<List<Province>>> call([void params]) async {
    return _repository.getProvinces();
  }
}
