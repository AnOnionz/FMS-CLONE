import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';

class GetNotesUsecase extends UseCase<List<NoteEntity>, FeatureEntity> {
  final NoteRepositoryImpl repository;

  GetNotesUsecase(this.repository);
  @override
  Future<Result<List<NoteEntity>>> call(FeatureEntity params) {
    return repository.allNotes(feature: params);
  }
}
