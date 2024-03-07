import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';

class RedeemGiftProductPage extends StatelessWidget {
  const RedeemGiftProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'product',
          style: context.textTheme.caption1?.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
