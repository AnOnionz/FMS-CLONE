import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';

class ReviewGift extends StatelessWidget {
  const ReviewGift({super.key});

  @override
  Widget build(BuildContext context) {
    return ReviewContainer(
        margin: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Danh sách quà',
              style: context.textTheme.subtitle1,
            ),
            SizedBox(
              height: 14.h,
            ),
            for (final int x in [1, 2, 3]) _GiftInfoItem(),
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

class _GiftInfoItem extends StatelessWidget {
  const _GiftInfoItem();

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
                'Quà A',
                style: context.textTheme.body1,
              )),
          Flexible(
              child: Text(
            'x1',
            style: context.textTheme.body1,
          )),
        ],
      ),
    );
  }
}
