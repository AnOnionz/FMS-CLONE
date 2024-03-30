import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';

class BoothItem extends StatelessWidget {
  final VoidCallback onPressed;
  final BoothEntity booth;
  const BoothItem({super.key, required this.onPressed, required this.booth});

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
        padding: Fx.p16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booth.name,
              style:
                  context.textTheme.subtitle1?.copyWith(color: AppColors.nero),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(booth.description ?? '',
                style: context.textTheme.caption1
                    ?.copyWith(color: AppColors.dimGray))
          ],
        ),
      ),
    );
  }
}
