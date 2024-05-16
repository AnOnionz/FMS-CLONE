import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/format.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class ReviewProduct extends StatefulWidget {
  final List<OrderProduct> products;
  final List<PurchaseEntity>? purchases;
  const ReviewProduct({super.key, required this.products, this.purchases});

  @override
  State<ReviewProduct> createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  final Map<OrderProduct, PurchaseEntity> _items = {};
  late int totalPrice;

  @override
  void didChangeDependencies() {
    _handleProducts();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ReviewProduct oldWidget) {
    _items.clear();
    _handleProducts();
    super.didUpdateWidget(oldWidget);
  }

  void _handleProducts() {
    widget.purchases?.forEach((purchase) {
      final product = widget.products.firstWhereOrNull(
          (element) => element.id == purchase.featureOrderProductId);
      if (product != null) {
        _items[product] = purchase;
      }
    });
    totalPrice = _items.entries.fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.value.quantity ?? 0) * (element.key.price ?? 0));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ReviewContainer(
        margin: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Danh sách sản phẩm',
              style: context.textTheme.subtitle1,
            ),
            SizedBox(
              height: 14.h,
            ),
            for (final item in _items.entries)
              _ProductInfoItem(product: item.key, purchase: item.value),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  'Tổng tiền',
                  style: context.textTheme.button2
                      ?.copyWith(color: AppColors.orange),
                )),
                Flexible(
                    child: Text(
                        kNumberFormater.formatString(totalPrice.toString()),
                        style: context.textTheme.subtitle1
                            ?.copyWith(color: AppColors.orange)))
              ],
            )
          ],
        ));
  }
}

class _ProductInfoItem extends StatelessWidget {
  final OrderProduct product;
  final PurchaseEntity purchase;
  const _ProductInfoItem({required this.product, required this.purchase});

  @override
  Widget build(BuildContext context) {
    final price = (purchase.quantity ?? 0) * (product.price ?? 0);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 5,
              child: Text(
                '${product.product!.name} (${product.productPackaging!.unitName})',
                style: context.textTheme.body1,
              )),
          Expanded(
              child: Text(
            'x${purchase.quantity}',
            style: context.textTheme.body1,
          )),
          Flexible(
              flex: 4,
              child: Text(
                kNumberFormater.formatString(price.toString()),
                style: context.textTheme.body1,
              ))
        ],
      ),
    );
  }
}
