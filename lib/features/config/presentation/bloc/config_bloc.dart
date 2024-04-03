import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/config/domain/entities/config.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../work_place/domain/usecases/params.dart';
import '../../domain/usecases/get_config_usecase.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final GetConfigUsecase getConfig;
  ConfigBloc({required this.getConfig}) : super(ConfigInitial()) {
    on<FetchConfig>((event, emit) async {
      emit(ConfigLoading());
      OverlayManager.showLoading();
      final execute = await getConfig(WorkPlaceParams(enitty: event.workPlace));
      OverlayManager.hide();
      execute.fold((fail) => emit(ConfigFailure(fail)), (config) {
        Modular.to.pushNamed(HomeModule.route);
        emit(ConfigSuccess(config));
      });
    });
  }
}
