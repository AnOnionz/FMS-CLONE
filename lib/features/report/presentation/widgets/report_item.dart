import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/carousel_images.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/image_picker_widget.dart';

class ReportItem extends StatelessWidget {
  final FeaturePhoto entity;
  final List<ReportEntity> photos;
  final bool isWatermark;
  final ValueNotifier<bool>? isWatermarking;
  final void Function(XFile file) onChanged;
  const ReportItem(
      {super.key,
      required this.entity,
      required this.photos,
      required this.isWatermark,
      this.isWatermarking,
      required this.onChanged});

  bool get _isFixed => entity.minimum == entity.maximum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                  )
                ]),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: ImagePickerWidget(
                        key: ValueKey(entity.id),
                        enable: photos.length < entity.maximum!,
                        onChanged: onChanged,
                        isWatermarkRequired: isWatermark,
                        isWatermarking: isWatermarking,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: CarouselImages(
                          images: photos
                              .map((e) => ImageDynamic(
                                  uuid: e.dataUuid,
                                  rawData: e.rawPath,
                                  networkImage: e.image))
                              .toList(),
                          isWatermarking: isWatermarking),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Text(
              entity.description ?? '',
              style: context.textTheme.caption2,
            ),
          )
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
