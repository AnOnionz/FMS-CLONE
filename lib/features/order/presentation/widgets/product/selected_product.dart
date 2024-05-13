import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/presentation/widgets/product/order_product_info.dart';

import '../../../../../core/styles/theme.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/item_container.dart';
import '../input_quantity.dart';
import 'order_product_image.dart';

class SelectedProduct extends StatefulWidget {
  final Map<OrderProduct, PurchaseEntity> items;

  const SelectedProduct({
    super.key,
    required this.items,
  });

  @override
  State<SelectedProduct> createState() => _SelectedProductState();
}

class _SelectedProductState extends State<SelectedProduct> {
  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return EmptyWidget();
    } else {
      return CustomScrollView(
        shrinkWrap: true,
        physics: kPhysics,
        slivers: [
          SliverList.separated(
            itemCount: widget.items.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 22.h,
            ),
            itemBuilder: (context, index) {
              final orderProduct = widget.items.keys.elementAt(index);
              final purchase = widget.items.values.elementAt(index);
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    widget.items.remove(orderProduct);
                  });
                },
                child: PurchaseContainer(
                    key: ValueKey(orderProduct.id!.toString()),
                    titleFlexible: false,
                    leading: OrderProductImage(product: orderProduct.product!),
                    title: OrderProductInfoWidget(
                        product: orderProduct.product!,
                        productPackaging: orderProduct.productPackaging!,
                        price: orderProduct.price!),
                    trailing: InputQuantity(
                      value: purchase.quantity!,
                      max: 10000,
                      onValueChanged: (value) {
                        setState(() {
                          purchase.updateQuantity(value);
                        });
                      },
                    )),
              );
            },
          )
        ],
      );
    }
  }
}
