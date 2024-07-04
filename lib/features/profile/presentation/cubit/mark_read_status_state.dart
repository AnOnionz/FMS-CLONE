part of 'mark_read_status_cubit.dart';

sealed class MarkReadStatusState extends Equatable {
  const MarkReadStatusState();

  @override
  List<Object> get props => [];
}

final class MarkReadStatusInitial extends MarkReadStatusState {}

final class MarkReadStatusLoading extends MarkReadStatusState {}

final class MarkReadStatusSuccess extends MarkReadStatusState {}

final class MarkReadStatusFailure extends MarkReadStatusState {
  final Failure failure;

  MarkReadStatusFailure(this.failure);
}
