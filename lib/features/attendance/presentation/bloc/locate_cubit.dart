import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/services/location/location_service.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:geolocator/geolocator.dart';

part 'locate_state.dart';

class LocateCubit extends Cubit<LocateState> {
  final LocationService locationService;
  LocateCubit({required this.locationService}) : super(LocateInitial());

  Future<void> getLocation() async {
    emit(LocateInProgress());
    try {
      final position = await locationService.getCurrentPosition();
      if (position == null) {
        if (!isClosed) {
          emit(LocateFailue(
              error: MessageFailure(
                  message: 'Không định vị được vị trí của bạn')));
        }
      } else {
        if (!this.isClosed) {
          emit(LocateSuccess(position: position));
        }
      }
    } catch (e) {
      if (!this.isClosed) {
        emit(LocateFailue(error: UnknowFailure(e, null)));
      }
    }
  }
}
