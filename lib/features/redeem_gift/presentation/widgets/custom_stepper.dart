// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class CustomStepper extends StatefulWidget {
  final List<StepData> steps;
  final Color color;
  const CustomStepper({
    super.key,
    required this.steps,
    this.color = AppColors.lavenderBlue,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  late final steps = widget.steps;

  void listener() {
    for (final StepData step in widget.steps) {
      if (Modular.to.path.endsWith(step.route)) {
        step.state = StepperState.editing;
      }
      if (step.state == StepperState.editing) {
        break;
      }
      if (step.state == StepperState.disabled) {
        step.state = StepperState.complete;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationListener(builder: (context, child) {
      listener();
      return Stack(
        children: [
          Divider(
            color: widget.color,
            thickness: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.steps
                .map((step) => StepContainer(
                    data: step,
                    inactiveColor: widget.color,
                    activeColor: '#FFCC80'.toColor()))
                .toList(),
          )
        ],
      );
    });
  }
}

class StepContainer extends StatelessWidget {
  final StepData data;

  final Color activeColor;
  final Color inactiveColor;

  const StepContainer({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    required this.data,
  });

  bool get isEditing => data.state != StepperState.disabled;

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
                  child: Icon(
                    Icons.done,
                    color: AppColors.white,
                    size: 14,
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
  final String route;
  StepperState state;

  StepData(
      {required this.name,
      required this.route,
      this.state = StepperState.disabled});

  @override
  String toString() => 'StepData(name: $name, route: $route, state: $state)';
}
