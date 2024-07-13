import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/sampling/data/repositories/sampling_repository_impl.dart';
import 'package:fms/features/sampling/domain/entities/sampling_entity.dart';

class GetSamplingUsecase extends UseCase<SamplingEntity?, GetSamplingParmas> {
  final SamplingRepositoryImpl _repository;

  GetSamplingUsecase(this._repository);

  @override
  Future<Result<SamplingEntity?>> call(GetSamplingParmas params) async {
    return _repository.getSamplings(
        featureId: params.featureId, attendanceId: params.attendanceId);
  }
}

class GetSamplingParmas extends Params {
  final int attendanceId;
  final int featureId;

  GetSamplingParmas({required this.attendanceId, required this.featureId});
}
