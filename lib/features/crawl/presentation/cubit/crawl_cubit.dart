import 'package:bloc/bloc.dart';
import 'package:fms/core/errors/failure.dart';

import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/crawl/domain/usecases/crawl_data_usecase.dart';
import 'package:fms/features/crawl/domain/usecases/get_quantities_usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

part 'crawl_state.dart';

class CrawlCubit extends Cubit<CrawlState> {
  final CrawlDataUsecase crawlData;
  final GetQuantitiesUsecase getQuantities;
  CrawlCubit(this.getQuantities, this.crawlData) : super(CrawlLoading());

  Future<void> saveData(
      {required CrawlQuantityEntity entity,
      required FeatureEntity feature}) async {
    OverlayManager.showLoading();
    final execute =
        await crawlData(QuantitiesParams(quantities: entity, feature: feature));
    execute.fold((failure) {
      OverlayManager.hide();
      showSuccess(title: 'Lưu thành công');
    }, (data) async {
      await getQuantities(feature)
        ..fold((failure) => null, (data) async => emit(CrawlSuccess(data)));
      OverlayManager.hide();
      showSuccess(title: 'Lưu thành công');
    });
  }

  Future<void> fetchData(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    emit(CrawlLoading());
    final execute = await getQuantities(feature);
    execute.fold((failure) async => emit(CrawlFailure(failure)),
        (data) async => emit(CrawlSuccess(data)));
  }
}
