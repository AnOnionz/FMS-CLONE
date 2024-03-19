import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_information_state.dart';

class AppInformationCubit extends Cubit<AppInformationState> {
  AppInformationCubit() : super(AppInformationInitial());
}
