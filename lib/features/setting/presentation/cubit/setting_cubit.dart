import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/database/database.dart';
import 'package:fms/features/setting/domain/entities/setting_app.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  void cameraToggle() {
    emit(state.cameraToggle());
  }
}
