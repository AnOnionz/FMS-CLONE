import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/features/attendance/presentation/widgets/attendance_history_item.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/date_picker.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          DatePicker(
              onSelected: (time) {},
              decoration: InputDecoration(
                  hintText: 'Chọn ngày',
                  hintStyle: context.textTheme.subtitle1,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  suffixIconConstraints: BoxConstraints(),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: SvgPicture.asset(
                      AppIcons.calendar,
                      height: 24.h,
                      colorFilter:
                          ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.sqr),
                      borderSide: BorderSide(color: '#EA9567'.toColor())),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.sqr),
                      borderSide: BorderSide(color: '#EA9567'.toColor())))),
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
