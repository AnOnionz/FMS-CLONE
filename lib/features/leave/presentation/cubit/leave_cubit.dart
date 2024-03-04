import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'leave_state.dart';

class LeaveCubit extends Cubit<LeaveState> {
  LeaveCubit() : super(LeaveInitial());
}
