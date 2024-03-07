import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../core/constant/colors.dart';

class RedeemGiftReceivePage extends StatelessWidget {
  const RedeemGiftReceivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'receive',
          style: context.textTheme.caption1?.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
