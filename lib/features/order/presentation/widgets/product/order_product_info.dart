import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/format.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../../core/constant/colors.dart';

class OrderProductInfoWidget extends StatelessWidget {
  final int price;
  final Product product;
  final ProductPackaging productPackaging;
  const OrderProductInfoWidget(
      {super.key,
      required this.product,
      required this.productPackaging,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            product.name!,
            style: context.textTheme.caption1,
          ),
        ),
        Text(
          productPackaging.barcode!,
          style: context.textTheme.caption2?.copyWith(color: AppColors.nobel),
        ),
        Text(
          '${kNumberFormater.formatString(price.toString())} vnd / ${productPackaging.unitName}',
          style: context.textTheme.caption2,
        )
      ],
    );
  }
}
