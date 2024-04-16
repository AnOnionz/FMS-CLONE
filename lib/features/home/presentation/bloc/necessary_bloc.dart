import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

part 'necessary_event.dart';
part 'necessary_state.dart';

class NecessaryBloc extends Bloc<NecessaryEvent, NecessaryState> {
  NecessaryBloc() : super(NecessaryInitial()) {
    on<NecessaryIn>(onNecessaryIn);
    on<NecessaryOut>(onNecessaryOut);
  }

  Future<void> onNecessaryIn(NecessaryIn event, emit) async {
    bool _isBlock = false;

    event.feature.dependentOnFeatureIds!.forEach((dependent) {
      final feature = event.general.config.features!
          .firstWhereOrNull((feature) => feature.id == dependent);
      if (feature != null) {
        switch (feature.type) {
          case FeatureType.attendanceClockingIn:
            if (event.general.attendance == null) {
              emit(NecessaryBlock());
              _isBlock = true;
              return;
            }
          default:
        }
      }
    });
    if (!_isBlock) {
      emit(NecessaryUncensored(feature: event.feature));
    }
  }

  Future<void> onNecessaryOut(NecessaryOut event, emit) async {
    bool _isBlock = false;

    if (event.general.attendance == null) {
      event.feature.dependentOnFeatureIds!.forEach((dependent) {
        final feature = event.general.config.features!
            .firstWhereOrNull((feature) => feature.id == dependent);
        if (feature != null &&
            feature.type == FeatureType.attendanceClockingIn) {
          emit(NecessaryBlock());
          _isBlock = true;
          return;
        }
      });
    }

    if (!_isBlock) {
      emit(NecessaryUncensored(feature: event.feature));
    }
  }
}
