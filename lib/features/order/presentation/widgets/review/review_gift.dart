import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class ReviewGift extends StatefulWidget {
  final List<FeatureScheme> schemes;
  final List<ExchangeEntity> exchanges;
  const ReviewGift({
    super.key,
    required this.schemes,
    required this.exchanges,
  });

  @override
  State<ReviewGift> createState() => _ReviewGiftState();
}

class _ReviewGiftState extends State<ReviewGift> {
  late final List<ExchangeProceed> _exchangeProceeds = [];

  final Map<dynamic, int> _gifts = {};

  late int total;

  late final schemeExchanges = widget.schemes
      .map((e) => e.exchanges)
      .expand((element) => element ?? <Exchange>[])
      .toList();

  @override
  void initState() {
    widget.exchanges.forEach((exchange) {
      final schemeExchange = schemeExchanges.firstWhereOrNull(
          (element) => element.id == exchange.featureSchemeExchangeId);

      if (schemeExchange != null) {
        final gifts = (schemeExchange.exchangeProceeds ?? [])
            .map((e) => e.copyWith(quantity: e.quantity! * exchange.quantity!));
        _exchangeProceeds.addAll(gifts);
      }
    });

    _exchangeProceeds.forEachIndexed((index, element) {
      if (element.product != null) {
        _gifts[(element.product, element.productPackaging)] =
            (_gifts[(element.product, element.productPackaging)] ?? 0) +
                element.quantity!;
      } else {
        _gifts[element.item] = (_gifts[element.item] ?? 0) + element.quantity!;
      }
    });
    total = _gifts.entries
        .fold(0, (previousValue, element) => previousValue + element.value);
    super.initState();
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
              'Danh sách quà',
              style: context.textTheme.subtitle1,
            ),
            SizedBox(
              height: 14.h,
            ),
            for (final gift in _gifts.entries)
              _GiftInfoItem(gift: gift.key, quantity: gift.value),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  'Tổng số lượng',
                  style: context.textTheme.button2
                      ?.copyWith(color: AppColors.orange),
                )),
                Flexible(
                    child: Text(total > 0 ? 'x${total}' : '$total',
                        style: context.textTheme.subtitle1
                            ?.copyWith(color: AppColors.orange)))
              ],
            )
          ],
        ));
  }
}

class _GiftInfoItem extends StatelessWidget {
  final dynamic gift;
  final int quantity;
  const _GiftInfoItem({required this.gift, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          switch (gift) {
            (final Product product, final ProductPackaging _) => Expanded(
                flex: 5,
                child: Text(
                  product.name!,
                  style: context.textTheme.body1,
                )),
            (final Item gift) => Expanded(
                flex: 5,
                child: Text(
                  gift.name!,
                  style: context.textTheme.body1,
                )),
            Object() => throw UnimplementedError(),
            null => throw UnimplementedError(),
          },
          Flexible(
              child: Text(
            'x${quantity}',
            style: context.textTheme.body1,
          )),
        ],
      ),
    );
  }
}
