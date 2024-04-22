import 'dart:async';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/note/domain/usecases/get_notes_no_synced_usecase.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:fms/features/report/domain/usecases/photos_no_synced_usecase.dart';

import '../../../../core/constant/type_def.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState>
    with LocalDatasource, GeneralDataMixin {
  final PhotosNoSyncedDataUsecase _photosNoSynced;
  final GetNotesNoSyncedDataUsecase _notesNoSynced;
  SyncBloc(this._photosNoSynced, this._notesNoSynced)
      : super(SyncState.init()) {
    on<SyncStarted>((event, emit) {
      _updatePhotoSync();
      _updateNoteSync();
    });
    on<SyncAddListener>((event, emit) {
      _photoSubscription =
          db.colection<PhotoEntity>().watchLazy().listen((event) async {
        _updatePhotoSync();
      });
      _noteSubscription =
          db.colection<NoteEntity>().watchLazy().listen((event) async {
        _updateNoteSync();
      });
    });

    on<SyncUpdated>((event, emit) async {
      final Map<FeatureEntity, List<DataEntity>> data = Map.from(state.data);
      data[event.feature] = event.data;
      final count = data.values.expand((element) => element).length;
      if (count == 0) {
        emit(SyncState.successfully());
      } else
        emit(SyncState.expectation(data: data, number: count));
    });
  }

  Future<void> _updatePhotoSync() async => await fold(_photosNoSynced());

  Future<void> _updateNoteSync() async => await fold(_notesNoSynced());

  Future<void> fold(Future<Result<Map<int, List<DataEntity>>>> future) async {
    print(future.runtimeType);
    await future
      ..fold((failure) => null, (data) {
        data.keys.forEach((id) {
          add(SyncUpdated(feature: getFeature(id)!, data: data[id]!));
        });
      });
  }

  StreamSubscription<void>? _photoSubscription;
  StreamSubscription<void>? _noteSubscription;
  @override
  Future<void> close() {
    _photoSubscription?.cancel();
    _noteSubscription?.cancel();
    return super.close();
  }
}
