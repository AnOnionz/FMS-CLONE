import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../core/constant/colors.dart';

class RedeemGiftCustomerPage extends StatelessWidget {
  const RedeemGiftCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'customer',
          style: context.textTheme.caption1?.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
