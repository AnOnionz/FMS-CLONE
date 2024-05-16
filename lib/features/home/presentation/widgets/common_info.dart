import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../../core/constant/colors.dart';

class CommonInfo extends StatelessWidget {
  final GeneralEntity general;
  const CommonInfo({super.key, required this.general});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.sqr),
              topRight: Radius.circular(60.sqr),
              bottomLeft: Radius.circular(5.sqr),
              bottomRight: Radius.circular(5.sqr)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 15,
              color: '#000000'.toColor(0.25),
            )
          ]),
      child: Padding(
        padding: EdgeInsets.all(22.h),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        general.outlet.name ?? '',
                        style: context.textTheme.subtitle1,
                      ),
                      SizedBox(height: 8.h),
                      Text(general.outlet.code ?? '',
                          style: context.textTheme.body2),
                      SizedBox(height: 8.h),
                      Text(general.booth.name ?? '',
                          style: context.textTheme.body2),
                      SizedBox(height: 8.h),
                      Text(general.outlet.address,
                          style: context.textTheme.body2)
                    ],
                  ),
                ),
                // Expanded(child: KpiChart())
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
            //   child: Divider(
            //     color: AppColors.gainsboro,
            //   ),
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //         child:
            //             StatChart(title: 'Số bán hôm nay', value: 8, max: 15)),
            //     SizedBox(
            //       width: 20.w,
            //     ),
            //     Expanded(
            //         child: StatChart(
            //       title: 'Số lượng quà tồn',
            //       value: 90,
            //       max: 100,
            //       isPercent: true,
            //     )),
            //     SizedBox(
            //       width: 20.w,
            //     ),
            //     Expanded(
            //         child: StatChart(
            //       title: 'Thời gian dự án',
            //       value: 8,
            //       max: 15,
            //     ))
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
