import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/routes/routes.dart';

class BoothItem extends StatelessWidget {
  const BoothItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.nextAndRemoveUntilRoute(Routes.home),
      child: Container(
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.squared)),
        padding: Fx.p16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coop smart Lê Văn Việt',
              style:
                  context.textTheme.subtitle1?.copyWith(color: AppColors.nero),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text('outlet000123',
                style: context.textTheme.caption1
                    ?.copyWith(color: AppColors.dimGray))
          ],
        ),
      ),
    );
  }
}
