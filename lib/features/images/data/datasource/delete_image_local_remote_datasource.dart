import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

import '../../../../core/utilities/parser.dart';

abstract class IDeteleImageLocalDataSource {
  Future<void> deleteLocalPhoto<T>({required String uuid});
  Future<void> deleteLocalNotePhoto<T>(
      {required String uuid, required String noteUuid});
}

class DeletePhotoLocalDataSource
    with LocalDatasource
    implements IDeteleImageLocalDataSource {
  @override
  Future<void> deleteLocalPhoto<T>({required String uuid}) async {
    db.deleteObject<PhotoEntity>(id: fastHash(uuid));
  }

  @override
  Future<void> deleteLocalNotePhoto<T>(
      {required String uuid, String? noteUuid}) async {
    final note = db.getObject<NoteEntity>(id: fastHash(noteUuid!));
    if (note != null) {
      note.photos.removeWhere((element) => element.dataUuid == uuid);
      note.photos.saveSync();
    }
  }
}
