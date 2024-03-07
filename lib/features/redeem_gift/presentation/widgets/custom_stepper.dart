import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class CustomStepper extends StatelessWidget {
  final List<StepData> steps;
  final Color color;
  const CustomStepper(
      {super.key, required this.steps, this.color = AppColors.lavenderBlue});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          color: color,
          thickness: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps
              .map((step) => StepContainer(
                  data: step,
                  inactiveColor: color,
                  activeColor: '#FFCC80'.toColor()))
              .toList(),
        )
      ],
    );
  }
}

class StepContainer extends StatelessWidget {
  final StepData data;
  final Color activeColor;
  final Color inactiveColor;
  const StepContainer(
      {super.key,
      required this.activeColor,
      required this.inactiveColor,
      required this.data});

  bool get isActive => data.state != StepperState.disabled;
  bool get isComplete => data.state == StepperState.complete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          isComplete
              ? Container(
                  height: 18.h,
                  width: 18.h,
                  decoration: BoxDecoration(
                    color: activeColor,
                    shape: BoxShape.circle,
                  ),
                  child: FadeInUp(
                    child: Icon(
                      Icons.done,
                      color: AppColors.white,
                      size: 14,
                    ),
                  ))
              : Container(
                  height: 18.h,
                  width: 18.h,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isActive ? activeColor : inactiveColor,
                          width: isActive ? 4.h : 2.h)),
                ),
          SizedBox(height: 10.h),
          Text(
            data.name,
            style: context.textTheme.caption3?.copyWith(color: AppColors.nobel),
          )
        ],
      ),
    );
  }
}

enum StepperState { disabled, editing, complete }

class StepData {
  final String name;
  StepperState state;

  StepData({required this.name, this.state = StepperState.complete});
}
