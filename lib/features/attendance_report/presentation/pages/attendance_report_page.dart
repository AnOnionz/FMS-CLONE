import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/attendance_report/presentation/widgets/attendance_report_item.dart';

import '../../../../core/styles/theme.dart';

class AttendanceReportPage extends StatelessWidget {
  const AttendanceReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Thống kê'),
      body: Padding(
        padding: EdgeInsets.only(
          top: 27.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h, left: 16.w),
              child: Text(
                'Danh sách Outlet',
                style: context.textTheme.h3,
              ),
            ),
            Expanded(
              child: CustomScrollView(
                physics: kPhysics,
                slivers: [
                  SliverList.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => AttendanceReportItem(
                      onPressed: () {},
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
