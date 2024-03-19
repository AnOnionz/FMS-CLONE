import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../core/constant/colors.dart';

class RowInfo extends StatelessWidget {
  final String leading;
  final String info;
  final bool isAddress;
  const RowInfo(
      {super.key,
      required this.leading,
      required this.info,
      this.isAddress = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading,
            style: context.textTheme.subtitle1
                ?.copyWith(color: AppColors.midnightExpress)),
        Text(info,
            style:
                isAddress ? context.textTheme.body2 : context.textTheme.body1)
      ],
    );
  }
}
