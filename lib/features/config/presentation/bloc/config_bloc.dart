import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/general/presentation/bloc/general_bloc.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../work_place/domain/usecases/params.dart';
import '../../domain/usecases/get_config_usecase.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final GetConfigUsecase getConfig;
  final GeneralBloc generalBloc;
  ConfigBloc({required this.getConfig, required this.generalBloc})
      : super(ConfigInitial()) {
    on<FetchConfig>((event, emit) async {
      emit(ConfigLoading());

      OverlayManager.showLoading();
      final execute = await getConfig(WorkPlaceParams(enitty: event.workPlace));
      final config = execute.fold((fail) {
        OverlayManager.hide();
        //dialog
        emit(ConfigFailure(fail));
        return null;
      }, (config) {
        return config;
      });

      if (config != null) {
        generalBloc.add(GeneralStared(
            project: event.workPlace.project!,
            outlet: event.workPlace.outlet!,
            booth: event.workPlace.booth!,
            config: config));
        OverlayManager.hide();
        Modular.to.pushNamed(HomeModule.route);
        emit(ConfigSuccess(config));
      }
    });
  }
}
