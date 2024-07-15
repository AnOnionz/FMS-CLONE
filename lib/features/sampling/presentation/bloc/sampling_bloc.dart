import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/sampling/domain/entities/sampling_entity.dart';
import 'package:fms/features/sampling/domain/usecases/update_samplings_usecase.dart';

part 'sampling_event.dart';
part 'sampling_state.dart';

class SamplingBloc extends Bloc<SamplingEvent, SamplingState> {
  final UpdateSamplingUsecase _updateSampling;

  SamplingBloc(this._updateSampling) : super(SamplingInitial()) {
    on<UpdateSampling>((event, emit) async {
      emit(SamplingLoading());
      await _updateSampling(UpdateSamplingParmas(
          entity: event.entity,
          attendanceId: event.attendanceId,
          featureId: event.featureId))
        ..fold((failure) => emit(SamplingFailure(failure)),
            (data) => emit(SamplingSuccess(entity: data!)));
    });
  }
}
