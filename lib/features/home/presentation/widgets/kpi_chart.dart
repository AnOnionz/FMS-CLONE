import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
        topLabelStyle: context.textTheme.subtitle1,
        topLabelText: '150/300',
        bottomLabelStyle:
            context.textTheme.caption1?.copyWith(color: AppColors.nobel),
        bottomLabelText: 'Kpi toàn dự án',
        mainLabelStyle: TextStyle(
            color: Colors.transparent,
            fontSize: 12,
            fontWeight: FontWeight.w400));
    return AbsorbPointer(
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
            customWidths: width,
            customColors: colors,
            infoProperties: info,
            startAngle: 270,
            angleRange: 360,
            size: 110.0),
        max: 300,
        initialValue: 150,
      ),
    );
  }
}
