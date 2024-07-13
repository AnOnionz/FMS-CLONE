import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sampling_event.dart';
part 'sampling_state.dart';

class SamplingBloc extends Bloc<SamplingEvent, SamplingState> {
  SamplingBloc() : super(SamplingInitial()) {
    on<SamplingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
