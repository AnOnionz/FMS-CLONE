import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../core/constant/colors.dart';

class RedeemGiftReviewPage extends StatelessWidget {
  const RedeemGiftReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'review',
          style: context.textTheme.caption1?.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
