import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

import 'circular_slider/appearance.dart';
import 'circular_slider/circular_slider.dart';

class KpiChart extends StatelessWidget {
  const KpiChart({super.key});

  @override
  Widget build(BuildContext context) {
    final width =
        CustomSliderWidths(trackWidth: 3.25.sp, progressBarWidth: 16.sp);
    final colors = CustomSliderColors(
        dotColor: AppColors.white,
        trackColors: [
          '#D6B382'.toColor(),
          '#9C1E53'.toColor(),
          '#D02231'.toColor(),
        ],
        progressBarColors: [
          '#D02231'.toColor(),
          '#DD4C57'.toColor(),
          '#FFBABA'.toColor(),
        ],
        dynamicGradient: true,
        trackGradientStartAngle: 90,
        trackGradientEndAngle: 270);
    final info = InfoProperties(
        topLabel: RichText(
            text: TextSpan(
                text: '150/',
                style: context.textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.black),
                children: [
              TextSpan(text: '300', style: context.textTheme.subtitle1)
            ])),
        bottomLabel: Text(
          'Kpi toàn dự án',
          style: TextStyle(
            color: AppColors.nobel,
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
        mainLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w300,
            height: 5));
    return AbsorbPointer(
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
            customWidths: width,
            customColors: colors,
            infoProperties: info,
            startAngle: 270,
            angleRange: 360,
            size: (context.screenWidth - 44.h - 32.w) / 3),
        max: 300,
        initialValue: 150,
      ),
    );
  }
}
