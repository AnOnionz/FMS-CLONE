import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/sync/domain/usecases/sync_usecase.dart';
import 'package:fms/features/sync/presentation/bloc/sync_bloc.dart';

import '../../../../core/errors/failure.dart';

part 'sync_progress_event.dart';
part 'sync_progress_state.dart';

class SyncProgressBloc extends Bloc<SyncProgressEvent, SyncProgressState> {
  final SyncUseCase _synchronized;
  final SyncBloc _syncBloc;

  SyncProgressBloc(this._syncBloc, this._synchronized)
      : super(SyncProgressInitial()) {
    on<SyncProgressStart>((event, emit) async {
      emit(SyncProgressLoading());
      await _synchronized(_syncBloc.state.data)
        ..fold((failure) => emit(SyncProgressFailure(failure)), (data) {
          emit(SyncProgressSuccess());
        });
    }, transformer: droppable());

    on<SyncProgressSilent>((event, emit) async {
      await Future.delayed(event.seconds.seconds);
      if (state is! SyncProgressLoading) {
        emit(SyncProgressLoading());
        await _synchronized(_syncBloc.state.data)
          ..fold((failure) {
            emit(SyncProgressSuccess());
            add(SyncProgressSilent(seconds: 100));
          }, (data) {
            emit(SyncProgressSuccess());
            _syncBloc.add(SyncStarted());
          });
      }
    }, transformer: restartable());
  }
}
