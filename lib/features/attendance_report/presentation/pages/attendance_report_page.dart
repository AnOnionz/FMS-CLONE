import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/styles/theme.dart';
import '../widgets/attendance_detail_item.dart';

class AttendanceReportPage extends StatefulWidget {
  final GeneralFeatureData entity;
  const AttendanceReportPage({super.key, required this.entity});

  @override
  State<AttendanceReportPage> createState() => _AttendanceReportPageState();
}

class _AttendanceReportPageState extends State<AttendanceReportPage> {
  late final outlet = widget.entity.general.outlet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name!),
      body: Padding(
        padding: EdgeInsets.only(
          top: 27.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(bottom: 4.h, left: 16.w, right: 16.w),
            //   child: DatePicker(),
            // ),
            Container(
              width: context.screenWidth,
              padding: EdgeInsets.symmetric(vertical: 16.w),
              margin: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 8.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.sqr)),
              child: Column(
                children: [
                  Text(outlet.name ?? '', style: context.textTheme.h3),
                  SizedBox(height: 8.h),
                  Text(
                    outlet.code ?? '',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                  )
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                physics: kPhysics,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(
                      bottom: 14.h,
                    ),
                    sliver: SliverList.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) => AttendanceDetailItem(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
