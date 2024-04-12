part of 'report_cubit.dart';

abstract class ReportState {
  const ReportState();
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportFailure extends ReportState {
  final Failure failure;

  ReportFailure(this.failure);
}

class ReportSuccess extends ReportState {
  final List<ReportEntity> photos;

  ReportSuccess(this.photos);
}
