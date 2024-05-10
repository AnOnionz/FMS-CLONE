import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/presentation/widgets/product/order_product_info.dart';

import '../../../../../core/styles/theme.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/item_container.dart';
import '../../pages/purchase_page.dart';
import '../input_quantity.dart';
import 'order_product_image.dart';

class SelectedProduct extends StatelessWidget {
  final State<OrderPurchasePage> state;
  final List<PurchaseEntity> items;

  const SelectedProduct({
    super.key,
    required this.items,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return EmptyWidget();
    } else {
      return CustomScrollView(
        shrinkWrap: true,
        physics: kPhysics,
        slivers: [
          SliverList.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 22.h,
            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return Dismissible(
                key: ValueKey(item.featureOrderProductId.toString()),
                onDismissed: (direction) {
                  // ignore: invalid_use_of_protected_member
                  state.setState(() {
                    items.removeAt(index);
                  });
                },
                child: ItemContainer(
                    key: ValueKey(item.orderProduct!.id!.toString()),
                    titleFlexible: false,
                    leading:
                        OrderProductImage(orderProduct: item.orderProduct!),
                    title: OrderProductInfoWidget(product: item.orderProduct!),
                    trailing: InputQuantity(
                      value: item.quantity!,
                      max: 10000,
                      onValueChanged: (value) {
                        // ignore: invalid_use_of_protected_member
                        state.setState(() {
                          item.updateQuantity(value);
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
