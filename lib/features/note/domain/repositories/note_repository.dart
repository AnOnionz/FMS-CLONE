import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';

abstract class NoteRepository {
  Future<Result<void>> createNotes(
      {required List<NoteEntity> notes,
      required List<PhotoEntity> photos,
      required FeatureEntity feature});
  Future<Result<(List<NoteEntity> notes, List<PhotoEntity> photos)>> allNotes(
      {required FeatureEntity feature});

  Future<Result<FeatureEntity?>> getNotesNotCompleted(
      {required FeatureEntity feature});
  Future<Result<Map<int, List<NoteEntity>>>> noSyncedData();
  Future<void> synchronized(FeatureEntity feature);
}
