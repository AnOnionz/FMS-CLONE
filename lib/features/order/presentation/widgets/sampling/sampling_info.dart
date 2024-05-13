import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../../core/constant/colors.dart';

class SamplingInfoWidget extends StatelessWidget {
  final Product product;
  final ProductPackaging productPackaging;
  const SamplingInfoWidget({
    super.key,
    required this.product,
    required this.productPackaging,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name!,
          style: context.textTheme.caption1,
        ),
        Text(
          productPackaging.barcode!,
          style: context.textTheme.caption2?.copyWith(color: AppColors.nobel),
        ),
        Text(
          product.brandName!,
          style: context.textTheme.caption2,
        )
      ],
    );
  }
}
