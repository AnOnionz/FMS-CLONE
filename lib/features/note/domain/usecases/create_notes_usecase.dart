import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';

import '../../../report/domain/entities/photo_entity.dart';

class CreateNotesUsecase extends UseCase<void, CreateNotesParams> {
  final NoteRepositoryImpl repository;

  CreateNotesUsecase(this.repository);
  @override
  Future<Result<void>> call(CreateNotesParams params) async {
    return repository.createNotes(
        notes: params.notes, photos: params.photos, feature: params.feature);
  }
}

class CreateNotesParams {
  final List<NoteEntity> notes;
  final List<PhotoEntity> photos;
  final FeatureEntity feature;

  CreateNotesParams(
      {required this.notes, required this.photos, required this.feature});
}
