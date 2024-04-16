import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/project_entity.dart';

class ProjectItem extends StatelessWidget {
  final ProjectEntity project;
  final VoidCallback onPressed;
  const ProjectItem(
      {super.key, required this.project, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.sqr),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 60,
                color: '#04060F'.toColor(0.05),
              )
            ]),
        child: Row(
          children: [
            Padding(
              padding: Fx.p16,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: AppColors.aliceBlue,
                      borderRadius: BorderRadius.circular(16.sqr)),
                  child: Padding(
                    padding: Fx.p16,
                    child: SvgPicture.asset(
                      AppIcons.document,
                      colorFilter:
                          ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                    ),
                  )),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name!,
                  style: context.textTheme.subtitle1
                      ?.copyWith(color: AppColors.nero),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                    '${project.startDate?.formatBy(kdMy)} - ${project.endDated?.formatBy(kdMy)}',
                    style: context.textTheme.caption1
                        ?.copyWith(color: AppColors.dimGray))
              ],
            )
          ],
        ),
      ),
    );
  }
}
