part of 'team_members_cubit.dart';

sealed class TeamMembersState extends Equatable {
  const TeamMembersState();

  @override
  List<Object> get props => [];
}

final class TeamMembersInitial extends TeamMembersState {}

final class TeamMembersLoading extends TeamMembersState {}

final class TeamMembersSuccess extends TeamMembersState {
  final List<EmployeeEntity> list;

  TeamMembersSuccess(this.list);
}

final class TeamMembersFailure extends TeamMembersState {
  final Failure failure;

  TeamMembersFailure(this.failure);
}
