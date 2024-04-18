import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';
import '../../../general/domain/entities/config_entity.dart';

class ExpectationTaskListView extends StatelessWidget {
  final List<FeatureEntity> features;
  const ExpectationTaskListView({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 32.h),
      child: CustomScrollView(
          shrinkWrap: true,
          physics:
              RangeMaintainingScrollPhysics(parent: ClampingScrollPhysics()),
          slivers: [
            SliverList.separated(
              itemCount: features.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemBuilder: (context, index) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(
                      height: 5.h,
                      width: 5.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.black),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    features[index].name!,
                    style: context.textTheme.caption2,
                  )),
                ],
              ),
            ),
          ]),
    );
  }
}
