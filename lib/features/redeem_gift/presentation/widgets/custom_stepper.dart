// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class CustomStepper extends StatefulWidget {
  final int current;
  final List<StepData> steps;
  final Color color;
  const CustomStepper({
    super.key,
    required this.current,
    required this.steps,
    this.color = AppColors.lavenderBlue,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  late final steps = widget.steps;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          color: widget.color,
          thickness: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.steps
              .mapIndexed((step, index) => StepContainer(
                  data: step,
                  index: index,
                  currentStep: widget.current,
                  inactiveColor: widget.color,
                  activeColor: '#FFCC80'.toColor()))
              .toList(),
        )
      ],
    );
  }
}

class StepContainer extends StatelessWidget {
  final StepData data;
  final int index;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;

  const StepContainer({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    required this.data,
    required this.index,
    required this.currentStep,
  });

  bool get isEditing => index == currentStep;

  bool get isComplete => index < currentStep;

  bool get isDisabled => index > currentStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                  child: Icon(
                    Icons.done,
                    color: AppColors.white,
                    size: 14.w,
                  ))
              : Container(
                  height: 18.h,
                  width: 18.h,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isEditing ? activeColor : inactiveColor,
                          width: isEditing ? 4.h : 2.h)),
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

  StepData({
    required this.name,
  });

  @override
  String toString() => 'StepData(name: $name)';
}
