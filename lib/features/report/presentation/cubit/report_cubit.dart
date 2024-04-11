import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/report/domain/usecases/create_photos_usecase.dart';
import 'package:fms/features/report/domain/usecases/get_photos_usecase.dart';

import '../../domain/entities/report_entity.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final CreatePhotosUsecase createPhotos;
  final GetPhotosUsecase getPhotos;
  ReportCubit(this.createPhotos, this.getPhotos) : super(ReportLoading());

  Future<void> savePhotos(
      {required List<ReportEntity> items,
      required GeneralEntity general,
      required FeatureEntity feature}) async {
    final execute = await createPhotos(
        CreatePhotosParams(photos: items, general: general, feature: feature));
    execute.fold((failure) => emit(ReportFailure(failure)),
        (data) => emit(ReportSuccess(data)));
  }

  Future<void> fetchPhotos(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    emit(ReportLoading());

    final execute =
        await getPhotos(GetPhotosParams(general: general, feature: feature));
    execute.fold((failure) => emit(ReportFailure(failure)),
        (data) => emit(ReportSuccess(data)));
  }
}
