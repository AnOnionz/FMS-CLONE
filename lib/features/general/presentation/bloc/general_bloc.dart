import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/services/location/location_service.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/domain/usecase/create_general_usecase.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final CreateGeneralUseCase createGeneral;
  final LocationService _locationService;
  GeneralBloc(this.createGeneral, this._locationService)
      : super(GeneralInitial()) {
    on<GeneralStared>((event, emit) async {
      emit(GeneralLoading());
      final general = GeneralEntity(
          project: event.project,
          outlet: event.outlet,
          booth: event.booth,
          config: event.config);

      await createGeneral(general); //???

      final isUseLocation = event.config.features
              .firstWhereOrNull(
                  (feature) => feature.type == FeatureType.attendanceClockingIn)
              ?.featureAttendance!
              .isLocationRequired ??
          false;
      if (isUseLocation) {
        _locationService.enablePositionSubscription();
      }

      emit(GeneralSuccess(general: general));
    });
  }
}
