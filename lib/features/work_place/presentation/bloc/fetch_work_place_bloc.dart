import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';
import 'package:fms/features/work_place/domain/usecases/get_projects_usecase.dart';
import 'package:fms/features/work_place/domain/usecases/params.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/usecases/get_booths_usecase.dart';
import '../../domain/usecases/get_outlets_usecase.dart';

part 'fetch_work_place_event.dart';
part 'fetch_work_place_state.dart';

class FetchWorkPlaceBloc
    extends Bloc<FetchWorkPlaceEvent, FetchWorkPlaceState> {
  final GetProjectsUsecase getProjects;
  final GetOutletsUsecase getOutlets;
  final GetBoothsUsecase getBooths;
  FetchWorkPlaceBloc(
      {required this.getProjects,
      required this.getOutlets,
      required this.getBooths})
      : super(FetchWorkPlaceInitial()) {
    on<FetchProjects>(_onFetchProjects, transformer: droppable());
    on<FetchOutlets>(_onFetchOutlets, transformer: droppable());
    on<FetchBooths>(_onFetchBooths, transformer: droppable());
  }

  Future<void> _onFetchBooths(FetchBooths event, emit) async {
    emit(FetchWorkPlaceLoading());
    final execute = await getBooths(WorkPlaceParams(enitty: event.workPlace));
    execute.fold((fail) => emit(FetchWorkPlaceFailure(fail)),
        (success) => emit(FetchWorkPlaceSuccess(success)));
  }

  Future<void> _onFetchOutlets(FetchOutlets event, emit) async {
    emit(FetchWorkPlaceLoading());
    final execute = await getOutlets(WorkPlaceParams(enitty: event.workPlace));
    execute.fold((fail) => emit(FetchWorkPlaceFailure(fail)),
        (success) => emit(FetchWorkPlaceSuccess(success)));
  }

  Future<void> _onFetchProjects(FetchProjects event, emit) async {
    emit(FetchWorkPlaceLoading());
    final execute = await getProjects();
    execute.fold((fail) => emit(FetchWorkPlaceFailure(fail)),
        (success) => emit(FetchWorkPlaceSuccess(success)));
  }
}
