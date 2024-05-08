import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../input_quantity.dart';

class GiftQuantityWidget extends StatelessWidget {
  final bool enable;
  final VoidCallback? onLimitGift;
  const GiftQuantityWidget({super.key, this.enable = true, this.onLimitGift});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultTextStyle(
              style:
                  TextStyle(color: enable ? AppColors.black : AppColors.nobel),
              child: Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text('x1',
                                  style: context.textTheme.subtitle1)),
                          Expanded(
                              flex: 15,
                              child: Text('Tên quà A',
                                  style: context.textTheme.body1)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text('x1',
                                  style: context.textTheme.subtitle1)),
                          Expanded(
                              flex: 15,
                              child: Text('Tên quà B',
                                  style: context.textTheme.body1)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 4,
                child: AbsorbPointer(
                  absorbing: !enable,
                  child: InputQuantity(
                    max: 5,
                    value: 0,
                    onMax: onLimitGift,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
