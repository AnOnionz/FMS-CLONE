import 'package:fms/features/note/domain/entities/note_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../general/domain/entities/config_entity.dart';

abstract class NoteRepository {
  Future<Result<void>> createNotes(
      {required List<NoteEntity> notes, required FeatureEntity feature});
  Future<Result<List<NoteEntity>>> allNotes({required FeatureEntity feature});
  Future<Result<FeatureEntity?>> getNotesNotCompleted(
      {required FeatureEntity feature});
  Future<Result<List<NoteEntity>>> noSyncedData();
  Future<void> synchronized();
}
