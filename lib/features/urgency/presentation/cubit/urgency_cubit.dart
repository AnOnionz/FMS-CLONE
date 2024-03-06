import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'urgency_state.dart';

class UrgencyCubit extends Cubit<UrgencyState> {
  UrgencyCubit() : super(UrgencyInitial());
}
