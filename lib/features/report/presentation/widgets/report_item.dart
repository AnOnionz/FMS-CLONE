import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class ReportItem extends StatefulWidget {
  final String name;
  final int min;
  final int max;
  final String description;
  const ReportItem(
      {super.key,
      required this.name,
      required this.min,
      required this.max,
      required this.description});

  @override
  State<ReportItem> createState() => _ReportItemState();
}

class _ReportItemState extends State<ReportItem> {
  final List<File> _image = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.squared)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: '${widget.name} ',
                style: context.textTheme.h3?.copyWith(color: AppColors.black),
                children: [
                  TextSpan(
                    text: getLimit(),
                    style:
                        context.textTheme.h3?.copyWith(color: AppColors.orange),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Container(
              height: 100.h,
              width: 100.h,
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.camera,
                  height: 50.h,
                  width: 50.h,
                ),
              ),
              decoration: BoxDecoration(
                  color: AppColors.aliceBlue,
                  borderRadius: BorderRadius.circular(13.33.squared)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Text(
              widget.description,
              style: context.textTheme.caption2,
            ),
          )
        ],
      ),
    );
  }

  String getLimit() {
    if (widget.min <= 0) {
      return '( ${widget.max} hình )';
    } else {
      return '( ${widget.min}-${widget.max} hình )';
    }
  }
}
