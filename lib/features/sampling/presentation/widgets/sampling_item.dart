import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/advanced_text_field.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/sampling/domain/entities/sampling_value_entity.dart';

class SamplingItem extends StatefulWidget {
  final SamplingValueEntity? entity;
  final FeatureSampling featureSampling;
  final Function(String value) onChanged;

  const SamplingItem(
      {super.key,
      required this.featureSampling,
      required this.onChanged,
      this.entity});

  @override
  State<SamplingItem> createState() => _SamplingItemState();
}

class _SamplingItemState extends State<SamplingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16.sqr)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                  child: Text(
                widget.featureSampling.product!.name!,
                style: context.textTheme.caption1,
              )),
              // Text(' - ',
              //     style: context.textTheme.caption1
              //         ?.copyWith(color: AppColors.nobel)),
              // Flexible(
              //     child: Text(widget.featureSampling.productPackaging!.barcode!,
              //         style: context.textTheme.caption1
              //             ?.copyWith(color: AppColors.nobel)))
            ],
          ),
          SizedBox(height: 8.w),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: AdvancedTextField(
                        value: widget.entity?.value?.toString(),
                        onChanged: widget.onChanged,
                        unit: widget.featureSampling.unit?.name)),
                SizedBox(
                  height: 56.h,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Transform.rotate(
                        angle: pi,
                        child: SvgPicture.asset(
                          AppIcons.backStepArrow,
                          colorFilter: ColorFilter.mode(
                              AppColors.nobel, BlendMode.srcIn),
                        )),
                  ),
                ),
                Expanded(
                  child: AdvancedTextField(
                      enable: false,
                      value: widget.entity?.conversionValue?.toString(),
                      unit: widget.featureSampling.productPackaging!.unitName),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
