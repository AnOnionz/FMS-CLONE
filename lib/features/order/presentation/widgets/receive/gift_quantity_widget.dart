import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/exchange_controller.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../../../../../core/constant/enum.dart';
import '../input_quantity.dart';

class GiftQuantityWidget extends StatefulWidget {
  final Exchange exchange;
  final List<OrderProduct> products;
  final ExchangeController controller;
  final ExchangeEntity? entity;
  final void Function(ExchangeEntity exchangeEntity, Exchange exchange)
      onIncreased;
  final void Function(ExchangeEntity exchangeEntity, Exchange exchange)
      onDecreased;

  const GiftQuantityWidget(
      {super.key,
      required this.controller,
      required this.exchange,
      required this.products,
      required this.entity,
      required this.onIncreased,
      required this.onDecreased});

  @override
  State<GiftQuantityWidget> createState() => _GiftQuantityWidgetState();
}

class _GiftQuantityWidgetState extends State<GiftQuantityWidget> {
  late final _exchange = widget.exchange;
  late final bool isCanExchange = widget.controller.isValid(_exchange, _value);
  late int _value = widget.entity?.quantity ?? 0;

  String getGiftUnitName(ExchangeProceed gift) {
    return switch (gift.item) {
      null => gift.productPackaging!.unitName ?? '',
      _ => gift.item!.unitName ?? '',
    };
  }

  void onChangeQuantity(ValueType type, int value) {
    final ExchangeEntity entity = ExchangeEntity(
        featureSchemeExchangeId: _exchange.id,
        exchangeProceeds: _exchange.exchangeProceeds,
        quantity: value);
    if (type == ValueType.increase) {
      widget.onIncreased(entity, _exchange);
    } else {
      widget.onDecreased(entity, _exchange);
    }
  }

  @override
  void initState() {
    Fx.log(_exchange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                  color: isCanExchange ? AppColors.black : AppColors.nobel),
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
                                      flex: 10,
                                      child: Text(
                                          'x${gift.quantity} ${getGiftUnitName(gift)}',
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
                        .toList()),
              ),
            ),
            Flexible(
                flex: 4,
                child: InputQuantity(
                  key: ValueKey(_exchange.id!.toString()),
                  isMax: !isCanExchange,
                  max: widget.exchange.maxReceiveQuantity!,
                  value: _value,
                  onIncreased: (value) =>
                      onChangeQuantity(ValueType.increase, value),
                  onDecreased: (value) =>
                      onChangeQuantity(ValueType.decrease, value),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                ))
          ],
        ),
      ),
    );
  }
}
