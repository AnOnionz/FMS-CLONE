import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';

class GetNotesNotCompletedUsecase
    extends UseCase<FeatureEntity?, FeatureEntity> {
  final NoteRepositoryImpl repository;

  GetNotesNotCompletedUsecase(this.repository);
  @override
  Future<Result<FeatureEntity?>> call(FeatureEntity params) {
    return repository.getNotesNotCompleted(feature: params);
  }
}
