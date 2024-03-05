import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/leave/domain/entities/project.dart';

class ProjectAvailable extends StatelessWidget {
  final Project project;
  final VoidCallback onPressed;
  const ProjectAvailable(
      {super.key, required this.project, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.squared),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 5,
                  color: AppColors.black.withOpacity(0.05))
            ]),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          onFocusChange: (value) => onPressed,
          trailing: Transform.rotate(
              angle: pi,
              child: SvgPicture.asset(
                height: 20.h,
                AppIcons.back,
                colorFilter:
                    ColorFilter.mode('#C3C6C9'.toColor(), BlendMode.srcIn),
              )),
          onTap: onPressed,
          title: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              'Dự án ${project.name}',
              style: context.textTheme.subtitle1
                  ?.copyWith(color: '#FF0000'.toColor()),
            ),
          ),
          subtitle: Text(
            '09:00 AM - 05:00 PM',
            style:
                context.textTheme.body1?.copyWith(color: '#8F9BB3'.toColor()),
          ),
        ),
      ),
    );
  }
}
