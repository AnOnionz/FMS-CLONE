import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/routes/routes.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.nextRoute(Routes.outletSelection),
      child: Container(
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.squared),
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
                      borderRadius: BorderRadius.circular(16.squared)),
                  child: Padding(
                    padding: Fx.p16,
                    child: Image.asset(AppImages.project),
                  )),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nước mắm Liên Thành',
                  style: context.textTheme.subtitle1
                      ?.copyWith(color: AppColors.nero),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text('11/11/2023 - 11/12/2023',
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
