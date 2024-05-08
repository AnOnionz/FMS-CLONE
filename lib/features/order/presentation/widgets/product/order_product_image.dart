import 'package:flutter/material.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/cached_image.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

class OrderProductImage extends StatelessWidget {
  final OrderProduct orderProduct;
  const OrderProductImage({super.key, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    if (orderProduct.product!.imageUrl == null)
      return Center(
          child: Image.asset(
        AppImages.product,
        width: 40.w,
      ));
    return CachedImage(
      imageUrl: orderProduct.product!.imageUrl!,
      errorWidget: (p0, p1, p2) => Center(
          child: Image.asset(
        AppImages.product,
        width: 40.w,
      )),
    );
  }
}
