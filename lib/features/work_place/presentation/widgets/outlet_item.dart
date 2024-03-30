import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';

class OutletItem extends StatelessWidget {
  final VoidCallback onPressed;
  final OutletEntity outlet;
  const OutletItem({super.key, required this.onPressed, required this.outlet});

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
              outlet.name,
              style:
                  context.textTheme.subtitle1?.copyWith(color: AppColors.nero),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(outlet.code,
                style: context.textTheme.caption1
                    ?.copyWith(color: AppColors.dimGray))
          ],
        ),
      ),
    );
  }
}
