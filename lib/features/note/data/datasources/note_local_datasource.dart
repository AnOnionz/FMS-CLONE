import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:isar/isar.dart';

import '../../domain/entities/note_entity.dart';

abstract class INoteLocalDataSource {
  void cacheNoteToLocal(NoteEntity note);
  void cachePhotoToLocal(PhotoEntity photo);
  void cacheNotesToLocal(List<NoteEntity> notes);
  Future<List<NoteEntity>> getNotesNoSynced(FeatureEntity feature);
  Future<List<NoteEntity>> getNotesByFeature(FeatureEntity feature);
  Future<List<NoteEntity>> getNotes();
}

class NoteLocalDataSource
    with LocalDatasource, GeneralDataMixin
    implements INoteLocalDataSource {
  @override
  void cacheNoteToLocal(NoteEntity note) {
    db.addObject<NoteEntity>(note);
  }

  @override
  Future<List<NoteEntity>> getNotesByFeature(FeatureEntity feature) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<NoteEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance?.id)
        .featureIdEqualTo(feature.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .build());
  }

  @override
  Future<List<NoteEntity>> getNotesNoSynced(FeatureEntity feature) async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();

    return db.filter<NoteEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance?.id)
        .featureIdEqualTo(feature.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .statusEqualTo(SyncStatus.isNoSynced)
        .build());
  }

  @override
  void cacheNotesToLocal(List<NoteEntity> notes) {
    db.addObjects<NoteEntity>(notes);
  }

  @override
  void cachePhotoToLocal(PhotoEntity photo) {
    db.addObject<PhotoEntity>(photo);
  }

  @override
  Future<List<NoteEntity>> getNotes() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<NoteEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance?.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .sortByDataTimestamp()
        .build());
  }
}
