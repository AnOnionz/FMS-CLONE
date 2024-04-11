import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/services/location/location_service.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/domain/usecase/create_general_usecase.dart';
import 'package:fms/features/general/domain/usecase/update_general_usecase.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final CreateGeneralUseCase createGeneral;
  final UpdateGeneralUseCase updateGeneral;
  final LocationService _locationService;
  GeneralBloc(this.createGeneral, this.updateGeneral, this._locationService)
      : super(GeneralInitial()) {
    on<GeneralStared>((event, emit) async {
      emit(GeneralLoading());

      await createGeneral(event.general); //???
      try {
        final isUseLocation = event.general.config.features
                .firstWhereOrNull((feature) =>
                    feature.type == FeatureType.attendanceClockingIn)
                ?.featureAttendance!
                .isLocationRequired ??
            false;
        if (isUseLocation) {
          _locationService.enablePositionSubscription();
        }
      } catch (e) {
        debugPrint('FeatureType.attendanceClockingIn not Found');
      }

      emit(GeneralSuccess(general: event.general));
    }, transformer: droppable());

    on<GeneralUpdate>((event, emit) async {
      final execute = await updateGeneral(event.attendance);
      execute.fold(
          (failure) => null, (data) => emit(GeneralSuccess(general: data)));
      ;
    }, transformer: droppable());
  }
}
