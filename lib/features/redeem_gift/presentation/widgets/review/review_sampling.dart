import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/redeem_gift/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';

class ReviewSampling extends StatelessWidget {
  const ReviewSampling({super.key});

  @override
  Widget build(BuildContext context) {
    return ReviewContainer(
        margin: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sampling',
              style: context.textTheme.subtitle1,
            ),
            SizedBox(
              height: 14.h,
            ),
            for (int x in [1, 2, 3]) _SamplingInfoItem(),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  'Tổng số lượng',
                  style: context.textTheme.button2
                      ?.copyWith(color: AppColors.orange),
                )),
                Flexible(
                    child: Text('x2',
                        style: context.textTheme.button2
                            ?.copyWith(color: AppColors.orange)))
              ],
            )
          ],
        ));
  }
}

class _SamplingInfoItem extends StatelessWidget {
  const _SamplingInfoItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 5,
              child: Text(
                'Sản phẩm A (lon)',
                style: context.textTheme.body1,
              )),
          Expanded(
              flex: 3,
              child: Text(
                'MA0001',
                style: context.textTheme.body1,
              )),
          Flexible(
              child: Text(
            'x3',
            style: context.textTheme.body1,
          ))
        ],
      ),
    );
  }
}
