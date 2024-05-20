part of 'statistic_bloc.dart';

abstract class StatisticEvent {
  const StatisticEvent();
}

class FetchTeamStatistic extends StatisticEvent {
  final int featureId;

  FetchTeamStatistic({required this.featureId});
}

class FetchIndividualStatistic extends StatisticEvent {
  final int featureId;

  FetchIndividualStatistic({required this.featureId});
}

class FetchEmployeeStatistic extends StatisticEvent {
  final int featureId;
  final int employeeId;

  FetchEmployeeStatistic({required this.featureId, required this.employeeId});
}
