import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../core/constant/colors.dart';
import 'kpi_chart.dart';

class CommonInfo extends StatelessWidget {
  const CommonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.squared),
              topRight: Radius.circular(60.squared),
              bottomLeft: Radius.circular(5.squared),
              bottomRight: Radius.circular(5.squared)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 15,
              color: '#000000'.toColor(0.25),
            )
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Emart Trường Chinh'),
                  Text('Maoutlet001'),
                  Text('Booth A'),
                  Text('123, Trường Chinh, Bình Thạnh, HCM')
                ],
              ),
              KpiChart()
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}
