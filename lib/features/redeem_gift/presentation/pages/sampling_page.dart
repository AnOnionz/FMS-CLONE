import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../core/constant/colors.dart';

class RedeemGiftSamplingPage extends StatelessWidget {
  const RedeemGiftSamplingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'sampling',
          style: context.textTheme.caption1?.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
