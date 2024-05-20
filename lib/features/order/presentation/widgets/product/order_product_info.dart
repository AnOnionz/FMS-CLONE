import 'package:flutter/material.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../../core/constant/format.dart';
import '../../../../../core/widgets/matter_container.dart';

class OrderProductInfoWidget extends StatelessWidget {
  final OrderProduct orderProduct;
  const OrderProductInfoWidget({super.key, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    return MatterInfoWidget(
        product: orderProduct.product!,
        productPackaging: orderProduct.productPackaging!,
        asset:
            '${kNumberFormater.formatString(orderProduct.price!.toString())} vnd / ${orderProduct.productPackaging!.unitName}');
  }
}
