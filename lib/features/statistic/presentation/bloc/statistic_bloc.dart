import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/statistic/domain/entities/statistic_entity.dart';
import 'package:fms/features/statistic/domain/usecases/fetch_employee_statistic_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/usecases/fetch_individual_statistic_usecase.dart';
import '../../domain/usecases/fetch_team_statistic_usecase.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final FetchTeamStatisticUseCase fetchTeamStatistic;
  final FetchIndividualStatisticUseCase fetchIndividualStatistic;
  final FetchEmployeeStatisticUseCase fetchEmployeeStatistic;
  StatisticBloc(this.fetchTeamStatistic, this.fetchIndividualStatistic,
      this.fetchEmployeeStatistic)
      : super(StatisticInitial()) {
    on<FetchIndividualStatistic>((event, emit) async {
      emit(StatisticLoading());
      final execute = await fetchIndividualStatistic(event.featureId);

      execute.fold((failure) => emit(StatisticFailure(failure)),
          (data) => emit(StatisticSuccess(data)));
    }, transformer: droppable());
    on<FetchTeamStatistic>((event, emit) async {
      emit(StatisticLoading());
      final execute = await fetchTeamStatistic(event.featureId);

      execute.fold((failure) => emit(StatisticFailure(failure)),
          (data) => emit(StatisticSuccess(data)));
    }, transformer: droppable());
    on<FetchEmployeeStatistic>((event, emit) async {
      emit(StatisticLoading());
      final execute = await fetchEmployeeStatistic(EmployeeStatisticParams(
          featureId: event.featureId, employeeId: event.employeeId));

      execute.fold((failure) => emit(StatisticFailure(failure)),
          (data) => emit(StatisticSuccess(data)));
    }, transformer: droppable());
  }
}
