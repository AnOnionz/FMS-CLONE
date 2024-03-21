import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/features/attendance/presentation/widgets/attendance_history_item.dart';

import '../../../../core/widgets/date_picker.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          DatePicker(),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
              physics: kPhysics,
              slivers: [
                SliverList.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) => Divider(
                    color: AppColors.gainsboro,
                    indent: 15.w,
                    endIndent: 15.w,
                  ),
                  itemBuilder: (context, index) {
                    return AttendanceHistoryItem();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
