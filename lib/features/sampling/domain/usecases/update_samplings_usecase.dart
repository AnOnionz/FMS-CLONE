import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/sampling_repository_impl.dart';
import '../entities/sampling_entity.dart';

class UpdateSamplingUsecase
    extends UseCase<SamplingEntity?, UpdateSamplingParmas> {
  final SamplingRepositoryImpl _repository;

  UpdateSamplingUsecase(this._repository);

  @override
  Future<Result<SamplingEntity?>> call(UpdateSamplingParmas params) async {
    return _repository.updateSamplings(
        entity: params.entity,
        featureId: params.featureId,
        attendanceId: params.attendanceId);
  }
}

class UpdateSamplingParmas extends Params {
  final SamplingEntity entity;
  final int attendanceId;
  final int featureId;

  UpdateSamplingParmas(
      {required this.entity,
      required this.attendanceId,
      required this.featureId});
}
