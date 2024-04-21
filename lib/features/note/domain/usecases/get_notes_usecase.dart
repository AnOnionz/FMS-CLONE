import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';

import '../../../report/domain/entities/photo_entity.dart';

class GetNotesUsecase extends UseCase<
    (List<NoteEntity> notes, List<PhotoEntity> photos), FeatureEntity> {
  final NoteRepositoryImpl repository;

  GetNotesUsecase(this.repository);
  @override
  Future<Result<(List<NoteEntity> notes, List<PhotoEntity> photos)>> call(
      FeatureEntity params) {
    return repository.allNotes(feature: params);
  }
}
