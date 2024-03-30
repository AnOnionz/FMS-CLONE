import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';

import '../../domain/entities/work_place_entity.dart';
import '../../work_place_module.dart';

part 'work_place_event.dart';
part 'work_place_state.dart';

class WorkPlaceBloc extends Bloc<WorkPlaceEvent, WorkPlaceState> {
  WorkPlaceBloc() : super(WorkPlaceState.init()) {
    on<ApplyProject>((event, emit) {
      final e = state.entity.copyWith(project: event.project);
      emit(state.copyWith(entity: e));
      Modular.to.pushNamed(WorkPlaceModule.selectOutlet);
    }, transformer: droppable());

    on<ApplyOutlet>((event, emit) {
      print(event.outlet);
      final e = state.entity.copyWith(outlet: event.outlet);
      emit(state.copyWith(entity: e));
      Modular.to.pushNamed(WorkPlaceModule.selectBooth);
    }, transformer: droppable());

    on<ApplyBooth>((event, emit) {
      final e = state.entity.copyWith(booth: event.booth);
      emit(state.copyWith(entity: e));
      Modular.to.pushNamed(WorkPlaceModule.config, arguments: state.entity);
    }, transformer: droppable());
  }
}
