import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class StatChart extends StatelessWidget {
  final String title;
  final int max;
  final int value;
  final bool isPercent;
  const StatChart(
      {super.key,
      required this.title,
      required this.max,
      this.isPercent = false,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final double _percent = value / max;
    return Column(
      children: [
        Text(
          title,
          style: context.textTheme.caption3,
        ),
        SizedBox(height: 8.h),
        LayoutBuilder(builder: (lineContext, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Divider(
                color: '#FFAEAE'.toColor(),
                height: 1.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    height: 3.h,
                    width: constraints.maxWidth * _percent,
                    decoration: BoxDecoration(
                        color: AppColors.brickRed,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(3, 2),
                              blurRadius: 12,
                              color: '#FF8C8C'.toColor(0.66))
                        ])),
              )
            ],
          );
        }),
        SizedBox(height: 12.h),
        getLabel(context)
      ],
    );
  }

  Widget getLabel(BuildContext context) {
    final double _percent = value / max;
    return switch (isPercent) {
      true => RichText(
          text: TextSpan(
              text: (_percent * 100).toStringAsFixed(0) + '%',
              style: context.textTheme.caption3
                  ?.copyWith(color: AppColors.alizarin))),
      _ => RichText(
          text: TextSpan(
              text: value.toString() + '/',
              style: context.textTheme.caption3
                  ?.copyWith(color: AppColors.alizarin),
              children: [
                TextSpan(
                    text: max.toString(),
                    style: context.textTheme.caption3
                        ?.copyWith(color: AppColors.nobel))
              ]),
        )
    };
  }
}
