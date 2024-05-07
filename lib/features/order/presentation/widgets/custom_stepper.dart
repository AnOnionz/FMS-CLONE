// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class CustomStepper extends StatefulWidget {
  final int current;
  final List<StepData> steps;
  final Color ignoredColor;
  final Color primaryColor;
  const CustomStepper({
    super.key,
    required this.current,
    required this.steps,
    required this.ignoredColor,
    required this.primaryColor,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    final _stepItemWidth = (context.screenWidth - 32.w) / 5;
    return Stack(
      children: [
        Divider(
          color: AppColors.silver,
          thickness: 2.h,
          indent: _stepItemWidth / 2,
          endIndent: _stepItemWidth / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.steps
              .map(
                (step) => ValueListenableBuilder(
                  valueListenable: step,
                  builder: (context, value, child) => StepContainer(
                      width: _stepItemWidth,
                      data: step,
                      currentStep: widget.current,
                      ignoredColor: widget.ignoredColor,
                      primaryColor: widget.primaryColor),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

class StepContainer extends StatefulWidget {
  final double width;
  final StepData data;
  final int currentStep;
  final Color primaryColor;
  final Color ignoredColor;

  const StepContainer({
    super.key,
    required this.width,
    required this.data,
    required this.currentStep,
    required this.primaryColor,
    required this.ignoredColor,
  });

  @override
  State<StepContainer> createState() => _StepContainerState();
}

class _StepContainerState extends State<StepContainer> {
  late final StepData step = widget.data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        children: [
          if (step.state == StepperState.disabled)
            Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.silver, width: 2.h)),
            ),
          if (step.state == StepperState.editing)
            Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: widget.primaryColor, width: 1.w)),
              child: Container(
                width: 4.w,
                height: 4.w,
                margin: EdgeInsets.all(7.w),
                decoration: BoxDecoration(
                    color: widget.primaryColor, shape: BoxShape.circle),
              ),
            ),
          if (step.state == StepperState.completed)
            Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.done,
                  color: AppColors.white,
                  size: 14.w,
                )),
          if (step.state == StepperState.ignored)
            Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                  color: widget.ignoredColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.priority_high,
                  color: AppColors.white,
                  size: 14.w,
                )),
          SizedBox(height: 10.h),
          Text(
            widget.data.name,
            style: context.textTheme.caption3?.copyWith(color: AppColors.nobel),
          )
        ],
      ),
    );
  }
}

enum StepperState { disabled, editing, completed, ignored }

class StepData extends ValueNotifier<StepperState> with EquatableMixin {
  final String name;
  StepperState state;
  StepperState oldState;

  StepData(
      {required this.name,
      this.state = StepperState.disabled,
      this.oldState = StepperState.disabled})
      : super(state);

  void setState(StepperState state) {
    this.oldState = this.state;
    this.state = state;
    Fx.log('set state $this');
    notifyListeners();
  }

  void resetState() {
    this.state = oldState;
    Fx.log('reset state $this');
    notifyListeners();
  }

  @override
  String toString() =>
      'StepData(name: $name, state: $state, oldState: $oldState)';

  @override
  List<Object?> get props => [state, name];
}
