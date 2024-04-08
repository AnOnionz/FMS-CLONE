import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/image_picker_widget.dart';

class ReportItem extends StatefulWidget {
  final ReportEntity entity;
  const ReportItem({super.key, required this.entity});

  @override
  State<ReportItem> createState() => _ReportItemState();
}

class _ReportItemState extends State<ReportItem> {
  bool get _isRequire => widget.entity.min == widget.entity.max;

  late final ValueNotifier<List<XFile>> _image =
      ValueNotifier(widget.entity.files);

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
                text: '${widget.entity.name} ',
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
              images: _image,
              max: widget.entity.max,
              isCarousel: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Text(
              widget.entity.description,
              style: context.textTheme.caption2,
            ),
          )
        ],
      ),
    );
  }

  String _optinal() {
    return switch (_isRequire) {
      true => '(bắt buộc chụp ${widget.entity.max} hình)',
      false => '(chụp từ ${widget.entity.min}-${widget.entity.max} hình)',
    };
  }
}
