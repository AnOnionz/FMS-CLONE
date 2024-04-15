import 'package:bloc/bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/popup.dart';
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
      {required List<PhotoEntity> items,
      required GeneralEntity general,
      required FeatureEntity feature}) async {
    OverlayManager.showLoading();
    final execute = await createPhotos(
        CreatePhotosParams(photos: items, general: general, feature: feature));
    execute.fold((failure) async {
      OverlayManager.hide();
      showFailure(
          title: 'Lưu thất bại',
          failure: failure,
          btnText: 'Thử lại',
          onPressed: () {
            OverlayManager.hide();
            savePhotos(items: items, general: general, feature: feature);
          });
    }, (data) async {
      await getPhotos(GetPhotosParams(general: general, feature: feature))
        ..fold((failure) async => emit(ReportSuccess([])),
            (data) async => emit(ReportSuccess(data)));
      OverlayManager.hide();
      showSuccess(title: 'Lưu thành công');
    });
  }

  Future<void> fetchPhotos(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    emit(ReportLoading());
    final execute =
        await getPhotos(GetPhotosParams(general: general, feature: feature));
    execute.fold((failure) async => emit(ReportFailure(failure)),
        (data) async => emit(ReportSuccess(data)));
  }
}
