import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.squared)),
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
                width: 6.h,
              ),
              Text('11/11/2023 - 11/12/2023',
                  style: context.textTheme.caption1
                      ?.copyWith(color: AppColors.dimGray))
            ],
          )
        ],
      ),
    );
  }
}
