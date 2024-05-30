import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/data_feature_widget.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../../core/styles/theme.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../report/presentation/widgets/photo_item.dart';
import '../widgets/bottom_buttons.dart';

class OrderPhotoPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final void Function(List<PhotoEntity> photos) onSaveData;
  const OrderPhotoPage(
      {super.key,
      required this.onNext,
      required this.onBack,
      required this.onSaveData});

  @override
  State<OrderPhotoPage> createState() => _OrderPhotoPageState();
}

class _OrderPhotoPageState extends State<OrderPhotoPage> {
  late final dataFeature = DataFeature.of(context);
  late final featurePhotos = dataFeature.data.feature.featurePhotos!;

  late final List<PhotoEntity> _photos = List.from(
      dataFeature.order.photos ?? dataFeature.order.localPhotos.toList());

  late final Map<FeaturePhoto, List<PhotoEntity>> _items = {};

  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  bool get validate => _items.entries.every((item) {
        return switch (item.key.isRequired) {
          true => item.value
                  .where((element) => element.status != SyncStatus.isDeleted)
                  .length >=
              item.key.minimum!,
          false => true
        };
      });

  @override
  void didChangeDependencies() {
    featurePhotos.forEach((featurePhoto) {
      final photos = _photos
          .where((element) => element.featurePhotoId == featurePhoto.id)
          .toList();
      _items[featurePhoto] = photos;
    });
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Fx.log(dataFeature.order);
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            physics: kPhysics,
            slivers: [
              SliverPadding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  sliver: SliverList.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items.entries.elementAt(index);
                      return PhotoItem(
                        entity: item.key,
                        feature: dataFeature.data.feature,
                        photos: item.value,
                        onAdded: (file) async {
                          item.value.add(PhotoEntity(
                            dataUuid: Uuid().v1(),
                            dataTimestamp: file.dataTimestamp,
                            path: file.path,
                            featureId: dataFeature.data.feature.id,
                            attendanceId:
                                dataFeature.data.general.attendance!.id,
                            featurePhotoId: item.key.id!,
                          ));
                          setState(() {});
                        },
                        onDeleted: (image) {
                          if (image.id != null) {
                            final photo = item.value.firstWhere(
                                (element) => element.dataUuid == image.uuid);
                            photo.status = SyncStatus.isDeleted;
                            photo.attendanceId =
                                dataFeature.data.general.attendance!.id;
                            photo.featureId = dataFeature.data.feature.id;
                          } else {
                            item.value.removeWhere(
                                (photo) => photo.dataUuid == image.uuid);
                          }
                          setState(() {});
                        },
                        isWatermark: item.key.isWatermarkRequired!,
                        isWatermarking: item.key.isWatermarkRequired!
                            ? isWatermarking
                            : null,
                      );
                    },
                  ))
            ],
          )),
          Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 25,
                  color: AppColors.black.withOpacity(0.15))
            ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: BottomButtons(
                onBack: widget.onBack,
                onNext: !isWatermarking.value && validate
                    ? () {
                        widget.onSaveData(_items.entries
                            .map((e) => e.value)
                            .expand((photos) => photos)
                            .toList());
                        Fx.log(_items.entries
                            .map((e) => e.value)
                            .expand((photos) => photos)
                            .toList());
                        widget.onNext();
                      }
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
