import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:fms/features/report/domain/usecases/photos_no_synced_usecase.dart';

import '../../../../core/mixins/common.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState>
    with LocalDatasource, GeneralDataMixin {
  final PhotosNoSyncedDataUsecase _photosNoSynced;
  SyncBloc(this._photosNoSynced) : super(SyncState.init()) {
    on<SyncStarted>((event, emit) {
      _updateReportSync();
      _reportSubscription =
          db.colection<PhotoEntity>().watchLazy().listen((event) async {
        _updateReportSync();
      });
    });
    on<SyncUpdated>((event, emit) async {
      final Map<FeatureType, List<dynamic>> data = Map.from(state.data);
      switch (event.type) {
        case FeatureType.photography:
          data[FeatureType.photography] = event.data;
        default:
      }
      final count = data.values.expand((element) => element).length;
      if (count == 0) {
        emit(SyncState.successfully());
      } else
        emit(SyncState.expectation(data: data, number: count));
    });
  }

  Future<void> _updateReportSync() async {
    Fx.log('_updateReportSync');
    await _photosNoSynced()
      ..fold((failure) => null, (data) {
        add(SyncUpdated(type: FeatureType.photography, data: data));
      });
  }

  StreamSubscription<void>? _reportSubscription;
  @override
  Future<void> close() {
    _reportSubscription?.cancel();
    return super.close();
  }
}
