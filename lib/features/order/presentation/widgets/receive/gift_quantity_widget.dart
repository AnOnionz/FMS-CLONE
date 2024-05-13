import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/exchange_controller.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../../../core/utilities/overlay.dart';
import '../../../../../core/widgets/button/flat.dart';
import '../input_quantity.dart';

class GiftQuantityWidget extends StatefulWidget {
  final Exchange exchange;
  final List<OrderProduct> products;
  final ExchangeController controller;
  final int priceUsed;
  final int value;
  final void Function(ExchangeEntity exchangeEntity, int? price)
      onQuantityChanged;

  const GiftQuantityWidget(
      {super.key,
      required this.controller,
      required this.exchange,
      required this.products,
      required this.priceUsed,
      required this.value,
      required this.onQuantityChanged});

  @override
  State<GiftQuantityWidget> createState() => _GiftQuantityWidgetState();
}

class _GiftQuantityWidgetState extends State<GiftQuantityWidget> {
  late final _exchange = widget.exchange;
  late final _purchases = widget.controller.products;
  late final bool enable = isValid();

  bool isValid() {
    if (_exchange.reachAmount != null &&
        widget.controller.order.totalPrice(widget.products) -
                (widget.value > 0 ? 0 : widget.priceUsed) <
            _exchange.reachAmount!) {
      return false;
    }
    if (_exchange.exchangeConditions!.isNotEmpty) {
      final orderProductQuantity = <int, int>{};
      final isValids = <bool>[];

      for (final ExchangeCondition condition in _exchange.exchangeConditions!) {
        final purchase = _purchases.firstWhereOrNull(
            (product) => meetProduct(product: product!, condition: condition));

        if (purchase != null) {
          final quantityUsed = switch (
              orderProductQuantity[purchase.$1.id!] != null) {
            true => orderProductQuantity[purchase.$1.id!]!,
            false => 0
          };

          if (purchase.$2 - quantityUsed - condition.quantity! >= 0) {
            isValids.add(true);
          } else {
            isValids.add(false);
          }
          orderProductQuantity[purchase.$1.id!] =
              quantityUsed + condition.quantity!;
        } else {
          isValids.add(false);
        }
      }

      switch (_exchange.logical) {
        case 'and':
          if (isValids.any((value) => value == false)) return false;
        case 'or':
          if (isValids.every((value) => value == false)) return false;
      }
    }
    return true;
  }

  bool meetProduct(
      {required (OrderProduct, int) product,
      required ExchangeCondition condition}) {
    final result = product.$1.product!.id == condition.product!.id &&
        product.$1.productPackaging!.id == condition.productPackaging!.id &&
        product.$2 >= condition.quantity!;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    void _showSheetLimitGift() {
      OverlayManager.showSheet(
          body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.h, bottom: 13.h),
            child: Text('SỐ LƯỢNG QUÀ',
                style: context.textTheme.h2
                    ?.copyWith(color: AppColors.nightRider)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: RichText(
                text: TextSpan(
                    text: 'Khách hàng có thể đổi tối đa ',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.midnightExpress),
                    children: [
                  TextSpan(
                      text: widget.exchange.maxReceiveQuantity!.toString(),
                      style: context.textTheme.body1?.copyWith(
                          color: AppColors.fireBrick,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: ' quà',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.midnightExpress))
                ])),
          ),
          FlatButton(
              onPressed: () => context.pop(),
              name: 'Xác nhận',
              color: AppColors.orange)
        ],
      ));
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultTextStyle(
              style:
                  TextStyle(color: enable ? AppColors.black : AppColors.nobel),
              child: Expanded(
                flex: 6,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.exchange.exchangeProceeds!
                        .map((gift) => Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text('x${gift.quantity}',
                                          style: context.textTheme.subtitle1)),
                                  Expanded(
                                      flex: 15,
                                      child: Text(
                                          gift.item != null
                                              ? gift.item!.name!
                                              : gift.product!.name!,
                                          style: context.textTheme.body1)),
                                ],
                              ),
                            ))
                        .toList()
                    //  [
                    //   Expanded(
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             flex: 3,
                    //             child: Text('x1',
                    //                 style: context.textTheme.subtitle1)),
                    //         Expanded(
                    //             flex: 15,
                    //             child: Text('Tên quà A',
                    //                 style: context.textTheme.body1)),
                    //       ],
                    //     ),
                    //   ),
                    //   Expanded(
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             flex: 3,
                    //             child: Text('x1',
                    //                 style: context.textTheme.subtitle1)),
                    //         Expanded(
                    //             flex: 15,
                    //             child: Text('Tên quà B',
                    //                 style: context.textTheme.body1)),
                    //       ],
                    //     ),
                    //   ),
                    // ],
                    ),
              ),
            ),
            Flexible(
                flex: 4,
                child: AbsorbPointer(
                  absorbing: !enable,
                  child: InputQuantity(
                    key: ValueKey(_exchange.id!.toString()),
                    max: widget.exchange.maxReceiveQuantity!,
                    value: widget.value,
                    onMax: _showSheetLimitGift,
                    onValueChanged: (value) {
                      final ExchangeEntity entity = ExchangeEntity(
                          featureSchemeExchangeId: _exchange.id,
                          quantity: value);
                      widget.onQuantityChanged(entity, _exchange.reachAmount);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
