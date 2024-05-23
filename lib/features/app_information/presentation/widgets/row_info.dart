import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../core/constant/colors.dart';

class RowInfo extends StatelessWidget {
  final String leading;
  final String info;

  const RowInfo({super.key, required this.leading, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading,
            style: context.textTheme.subtitle1
                ?.copyWith(color: AppColors.midnightExpress)),
        Flexible(
            child: Text(info,
                textAlign: TextAlign.right, style: context.textTheme.body1))
      ],
    );
  }
}
