import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/routes/routes.dart';

class OutletItem extends StatelessWidget {
  const OutletItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.nextRoute(Routes.boothSelection),
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
            Text('ma000123',
                style: context.textTheme.caption1
                    ?.copyWith(color: AppColors.dimGray))
          ],
        ),
      ),
    );
  }
}
