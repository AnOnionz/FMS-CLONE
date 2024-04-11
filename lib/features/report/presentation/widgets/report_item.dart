import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/config/domain/entities/config_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/image_picker_widget.dart';

class ReportItem extends StatelessWidget {
  final FeaturePhoto entity;
  final ValueNotifier<List<XFile>> files;
  final bool isWatermark;
  final ValueNotifier<bool>? isWatermarking;
  const ReportItem(
      {super.key,
      required this.entity,
      required this.files,
      required this.isWatermark,
      required this.isWatermarking});

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
            child: ImagePickerWidget(
              key: ValueKey(entity.id),
              images: files,
              max: entity.maximum,
              isCarousel: true,
              isWatermarkRequired: isWatermark,
              isWatermarking: isWatermarking,
            ),
          ),
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
