import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/constant/enum.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  SyncBloc() : super(SyncState.init()) {
    on<SyncUpdated>((event, emit) async {
      state.features.add(event.type);
      emit(SyncState.expectation(state.features));
    });
  }
}
