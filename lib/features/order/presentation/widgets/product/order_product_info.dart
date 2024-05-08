import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constant/colors.dart';

final productPriceFormat = NumberFormat.currency(
  symbol: '',
);

class OrderProductInfoWidget extends StatelessWidget {
  final OrderProduct product;
  const OrderProductInfoWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.product!.name!,
          style: context.textTheme.caption1,
        ),
        Text(
          product.productPackaging!.barcode!,
          style: context.textTheme.caption2?.copyWith(color: AppColors.nobel),
        ),
        Text(
          '${productPriceFormat.format(product.price)} vnd / ${product.productPackaging!.unitName}',
          style: context.textTheme.caption2,
        )
      ],
    );
  }
}
