import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/home/presentation/widgets/notifications.dart';
import 'package:fms/features/report/domain/usecases/get_photos_not_completed_usecase.dart';
import 'package:fms/features/sync/presentation/bloc/sync_bloc.dart';
import 'package:fms/features/sync/sync_module.dart';
import '../../../report/domain/usecases/photos_no_synced_usecase.dart';
import '../../domain/entities/general_item_data.dart';

part 'necessary_event.dart';
part 'necessary_state.dart';

class NecessaryBloc extends Bloc<NecessaryEvent, NecessaryState>
    with GeneralDataMixin {
  final GetPhotosNotCompletedUsecase getPhotosNotCompleted;
  final SyncBloc _syncBloc;
  StreamSubscription<NecessaryState>? subscription;
  NecessaryBloc(this.getPhotosNotCompleted, this._syncBloc)
      : super(NecessaryInit()) {
    on<NecessaryIn>(onNecessaryIn);
    on<NecessaryOut>(onNecessaryOut);
    on<NecessarySignOut>(onNecessarySignOut);

    subscription = stream.listen((state) {
      if (state is NecessaryLockIn) {
        final action = () {
          Modular.to.pushNamed('/${state.feature.type!.name}/',
              arguments:
                  GeneralItemData(general: general, feature: state.feature));
        };
        switch (state.feature.type) {
          case FeatureType.attendanceClockingIn:
            showRequiredAttendanceIn(() => action.call());
            break;
          default:
            showRequiredFeature(state.feature.name!, () => action.call());
        }
      }
      if (state is NecessaryLockOut) {
        showRequiredTask(
          features: state.features,
          onPressed: () {
            Modular.to.pushNamedAndRemoveUntil(HomeModule.route, (p0) => false);
          },
        );
      }
      if (state is NecessaryUnfastenIn) {
        Modular.to.pushNamed('/${state.feature.type!.name}/',
            arguments:
                GeneralItemData(general: general, feature: state.feature));
      }

      if (state is NecessaryUnfastenOut) {
        state.action();
      }

      if (state is NecessaryTask) {
        showRequiredTask(
          features: state.features,
          forSignout: true,
          onPressed: () {
            state.onClose();
            Modular.to.pushNamedAndRemoveUntil(HomeModule.route, (p0) => false);
          },
        );
      }
      if (state is NecessarySync) {
        showRequiredSync(
          () {
            state.onClose();
            Modular.to.pushNamed(SyncModule.route);
          },
        );
      }
      if (state is NecessaryAttendanceOut) {
        showRequiredAttendanceOut(() {
          Modular.to.pushNamed('/${state.feature.type!.name}/',
              arguments:
                  GeneralItemData(general: general, feature: state.feature));
        });
      }
    });
  }

  Future<void> onNecessaryIn(NecessaryIn event, emit) async {
    bool _isLock = false;

    event.feature.dependentOnFeatureIds!.forEach((dependent) {
      final feature = general.config.features!
          .firstWhereOrNull((feature) => feature.id == dependent);
      if (feature != null) {
        switch (feature.type) {
          case FeatureType.attendanceClockingIn:
            if (general.attendance == null ||
                (general.attendance != null &&
                    general.attendance!.dataOut != null)) {
              emit(NecessaryLockIn(feature: feature));
              _isLock = true;
              break;
            }
          default:
        }
      }
    });
    if (!_isLock) {
      emit(NecessaryUnfastenIn(feature: event.feature));
    }
  }

  Future<void> onNecessaryOut(NecessaryOut event, emit) async {
    final features =
        await checkTasksNotCompleted(feature: event.feature, general: general);
    features.removeWhere(
        (element) => element.type == FeatureType.attendanceClockingOut);
    if (features.isNotEmpty) {
      emit(NecessaryLockOut(features: features));
    }
    if (features.isEmpty) {
      emit(NecessaryUnfastenOut(action: event.action));
    }
  }

  Future<void> onNecessarySignOut(NecessarySignOut event, emit) async {
    final features = await checkTasksNotCompleted(general: general);

    if (features.isEmpty) {
      emit(NecessaryUnfastenOut(
        action: event.action,
      ));
      return;
    }

    ///  check tasks
    final tasks = features
        .where((feature) => feature.type != FeatureType.attendanceClockingOut);
    if (tasks.isNotEmpty) {
      features.removeWhere(
          (element) => element.type == FeatureType.attendanceClockingOut);
      emit(NecessaryTask(onClose: event.onClose, features: features));
      return;
    }

    ///check sync
    final featureSync = general.config.features!.firstWhereOrNull(
        (element) => element.type == FeatureType.synchronization);
    if (featureSync != null) {
      final hasSynced = _syncBloc.state.number > 0;

      if (hasSynced) {
        emit(NecessarySync(onClose: event.onClose));
        return;
      }
    }

    /// check attendance out
    final featureAttendanceOut = features.firstWhereOrNull(
        (feature) => feature.type == FeatureType.attendanceClockingOut);
    if (featureAttendanceOut != null) {
      emit(NecessaryAttendanceOut(feature: featureAttendanceOut));
      return;
    }
  }

  Future<List<FeatureEntity>> checkTasksNotCompleted(
      {required GeneralEntity general, FeatureEntity? feature}) async {
    final List<FeatureEntity> features = [];
    final List<int> dependentOnFeatureIds = [];
    if (feature == null) {
      dependentOnFeatureIds.addAll(general.config.features
              ?.where((feature) => !feature.type!.isAssistance)
              .map((e) => e.id!) ??
          []);
    } else {
      dependentOnFeatureIds.addAll(feature.dependentOnFeatureIds ?? []);
    }
    await Future.forEach(dependentOnFeatureIds, (dependent) async {
      final dependentFeature = general.config.features!
          .firstWhereOrNull((feature) => feature.id == dependent);
      if (dependentFeature != null) {
        if (dependentFeature.type == FeatureType.photography) {
          await getPhotosNotCompleted(dependentFeature)
            ..fold((failure) {}, (data) {
              if (data != null) {
                features.add(data);
              }
            });
        }
        if (dependentFeature.type == FeatureType.attendanceClockingOut) {
          if (general.attendance != null &&
              general.attendance!.dataOut == null) {
            features.add(dependentFeature);
          }
        }
      }
    });
    return features;
  }

  // Future<bool> checkHasNoSynced({required GeneralEntity general}) async {
  //   bool hasNoSynced = false;
  //   final List<int> featureIds = general.config.features
  //           ?.where((feature) => !feature.type!.isAssistance)
  //           .map((e) => e.id!)
  //           .toList() ??
  //       [];

  //   await Future.forEach(featureIds, (dependent) async {
  //     final dependentFeature = general.config.features!
  //         .firstWhereOrNull((feature) => feature.id == dependent);
  //     if (dependentFeature != null) {
  //       if (dependentFeature.type == FeatureType.photography) {
  //         await hasPhotosNoSynced(general)
  //           ..fold((failure) {}, (data) {
  //             if (data.isNotEmpty) {
  //               hasNoSynced = true;
  //             }
  //           });
  //       }
  //     }
  //     if (hasNoSynced) return hasNoSynced;
  //   });
  //   return hasNoSynced;
  // }
}
