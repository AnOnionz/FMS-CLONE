// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

class CustomStepper extends StatefulWidget {
  final int current;
  final OrderEntity order;
  final List<StepData> steps;
  final Color ignoredColor;
  final Color primaryColor;
  const CustomStepper({
    super.key,
    required this.current,
    required this.steps,
    required this.ignoredColor,
    required this.primaryColor,
    required this.order,
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
                (step) => StepContainer(
                    width: _stepItemWidth,
                    name: step.name,
                    state: step.getState(
                        order: widget.order, currentIndex: widget.current),
                    ignoredColor: widget.ignoredColor,
                    primaryColor: widget.primaryColor),
              )
              .toList(),
        )
      ],
    );
  }
}

class StepContainer extends StatelessWidget {
  final double width;
  final String name;
  final StepperState state;
  final Color primaryColor;
  final Color ignoredColor;

  const StepContainer({
    super.key,
    required this.width,
    required this.name,
    required this.state,
    required this.primaryColor,
    required this.ignoredColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          _icon(),
          SizedBox(height: 10.h),
          Text(
            name,
            style: context.textTheme.caption3?.copyWith(color: AppColors.nobel),
          )
        ],
      ),
    );
  }

  Widget _icon() {
    if (state == StepperState.editing)
      return Container(
        height: 20.w,
        width: 20.w,
        decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: 1.w)),
        child: Container(
          width: 4.w,
          height: 4.w,
          margin: EdgeInsets.all(7.w),
          decoration:
              BoxDecoration(color: primaryColor, shape: BoxShape.circle),
        ),
      );
    if (state == StepperState.completed)
      return Container(
          height: 20.w,
          width: 20.w,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.done,
            color: AppColors.white,
            size: 14.w,
          ));
    if (state == StepperState.ignored)
      return Container(
          height: 20.w,
          width: 20.w,
          decoration: BoxDecoration(
            color: ignoredColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.priority_high,
            color: AppColors.white,
            size: 14.w,
          ));

    return Container(
      height: 20.w,
      width: 20.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.silver, width: 2.h)),
    );
  }
}

enum StepperState { disabled, editing, completed, ignored }

abstract class StepData extends Equatable {
  final String name;
  final int index;

  StepperState getState(
      {required OrderEntity order, required int currentIndex});

  StepData({
    required this.name,
    required this.index,
  });

  @override
  String toString() => 'StepData(name: $name, index: $index )';

  @override
  List<Object?> get props => [index, name];
}

class CustomerStep extends StepData {
  CustomerStep({required super.name, required super.index});

  @override
  StepperState getState(
      {required OrderEntity order, required int currentIndex}) {
    if (currentIndex == index) {
      return StepperState.editing;
    }
    if (order.customerInfos == null) {
      return StepperState.disabled;
    }
    if (order.customerInfos!.isNotEmpty) {
      return StepperState.completed;
    }

    return StepperState.ignored;
  }
}

class PurchaseStep extends StepData {
  PurchaseStep({required super.name, required super.index});

  @override
  StepperState getState(
      {required OrderEntity order, required int currentIndex}) {
    if (currentIndex == index) {
      return StepperState.editing;
    }
    if (order.purchases == null) {
      return StepperState.disabled;
    }
    if (order.purchases!.isNotEmpty) {
      return StepperState.completed;
    }

    return StepperState.ignored;
  }
}

class ExchangeStep extends StepData {
  ExchangeStep({required super.name, required super.index});

  @override
  StepperState getState(
      {required OrderEntity order, required int currentIndex}) {
    if (currentIndex == index) {
      return StepperState.editing;
    }
    if (order.exchanges == null) {
      return StepperState.disabled;
    }
    if (order.exchanges!.isNotEmpty) {
      return StepperState.completed;
    }

    return StepperState.ignored;
  }
}

class SamplingStep extends StepData {
  SamplingStep({required super.name, required super.index});

  @override
  StepperState getState(
      {required OrderEntity order, required int currentIndex}) {
    if (currentIndex == index) {
      return StepperState.editing;
    }
    if (order.samplings == null) {
      return StepperState.disabled;
    }
    if (order.samplings!.isNotEmpty) {
      return StepperState.completed;
    }

    return StepperState.ignored;
  }
}

class PhotoStep extends StepData {
  PhotoStep({required super.name, required super.index});

  @override
  StepperState getState(
      {required OrderEntity order, required int currentIndex}) {
    if (currentIndex == index) {
      return StepperState.editing;
    }
    if (order.photos == null && order.localPhotos.isEmpty) {
      return StepperState.disabled;
    }
    if ((order.photos ?? order.localPhotos.toList()).isNotEmpty) {
      return StepperState.completed;
    }

    return StepperState.ignored;
  }
}
