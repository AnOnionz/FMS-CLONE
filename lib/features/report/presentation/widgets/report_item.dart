import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/listview_images.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';

import '../../../../core/widgets/image_picker_widget.dart';

class ReportItem extends StatelessWidget {
  final FeaturePhoto entity;
  final FeatureEntity feature;
  final List<PhotoEntity> photos;
  final bool isWatermark;
  final ValueNotifier<bool>? isWatermarking;
  final void Function(ImageDynamic image) onAdded;
  final void Function(ImageDynamic image) onDeleted;
  const ReportItem(
      {super.key,
      required this.entity,
      required this.photos,
      required this.isWatermark,
      this.isWatermarking,
      required this.onAdded,
      required this.feature,
      required this.onDeleted});

  bool get _isFixed => entity.minimum == entity.maximum;

  @override
  Widget build(BuildContext context) {
    final imageSize = Size(60, 60);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16.sqr)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: '${entity.name} ',
                style: context.textTheme.subtitle1
                    ?.copyWith(color: AppColors.black),
                children: [
                  TextSpan(
                    text: _optinal(),
                    style: context.textTheme.subtitle1
                        ?.copyWith(color: AppColors.orange),
                  ),
                ]),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: SizedBox(
                height: imageSize.height,
                child: Row(
                  children: [
                    ImagePickerWidget(
                      size: imageSize,
                      enable: photos.length < entity.maximum!,
                      onChanged: onAdded,
                      isWatermarkRequired: isWatermark,
                      isWatermarking: isWatermarking,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: ListViewImages(
                        feature: feature,
                        size: imageSize,
                        images: photos
                            .map((e) => ImageDynamic(
                                id: e.id,
                                uuid: e.dataUuid,
                                dataTimestamp: e.dataTimestamp,
                                path: e.path,
                                networkImage: e.image))
                            .toList(),
                        onDeleted: onDeleted,
                      ),
                    ),
                  ],
                ),
              )),
          (entity.description != null)
              ? Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    entity.description!,
                    style: context.textTheme.caption2,
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }

  String _optinal() {
    return switch (_isFixed) {
      true => '(bắt buộc chụp ${entity.maximum} hình)',
      false => '(chụp từ ${entity.minimum}-${entity.maximum} hình)',
    };
  }
}
