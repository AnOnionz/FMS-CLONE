import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';

import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:isar/isar.dart';

import '../../domain/entities/note_entity.dart';

abstract class INoteLocalDataSource {
  void cacheNoteToLocal(NoteEntity note);
  void cacheNotesToLocal(List<NoteEntity> notes);
  Future<List<NoteEntity>> getNotesNoSynced();
  Future<List<NoteEntity>> getNotesLocal();
}

class NoteLocalDataSource
    with LocalDatasource, GeneralDataMixin
    implements INoteLocalDataSource {
  @override
  void cacheNoteToLocal(NoteEntity note) {
    db.addObject<NoteEntity>(note);
  }

  @override
  Future<List<NoteEntity>> getNotesLocal() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();
    return db.filter<NoteEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance!.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .sortByDataTimestamp()
        .build());
  }

  @override
  Future<List<NoteEntity>> getNotesNoSynced() async {
    final time = await Modular.get<NetworkTimeService>().betweenToday();

    return db.filter<NoteEntity>((filter) => filter
        .attendanceIdEqualTo(general.attendance?.id)
        .dataTimestampBetween(time.yesterday, time.today)
        .statusEqualTo(SyncStatus.noSynced)
        .build());
  }

  @override
  void cacheNotesToLocal(List<NoteEntity> notes) {
    db.addObjects<NoteEntity>(notes);
  }
}
