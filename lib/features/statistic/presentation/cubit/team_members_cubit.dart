import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/statistic/domain/usecases/fetch_team_members_usecase.dart';

import '../../domain/entities/employee_entity.dart';

part 'team_members_state.dart';

class TeamMembersCubit extends Cubit<TeamMembersState> {
  final FetchTeamMembersUseCase fetchTeamMembers;
  TeamMembersCubit(this.fetchTeamMembers) : super(TeamMembersInitial());

  Future<void> getTeamMembers(int featureId) async {
    emit(TeamMembersLoading());

    await fetchTeamMembers(featureId)
      ..fold((failure) => emit(TeamMembersFailure(failure)),
          (data) => emit(TeamMembersSuccess(data)));
  }
}
