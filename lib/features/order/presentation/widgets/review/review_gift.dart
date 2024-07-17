import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/review/review_container.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class ReviewGift extends StatefulWidget {
  final String title;
  final bool isPlayedGame;
  final List<FeatureScheme> schemes;
  final List<ExchangeEntity> exchanges;
  const ReviewGift({
    super.key,
    required this.schemes,
    required this.exchanges,
    required this.title,
    this.isPlayedGame = false,
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
      .where(
          (element) => (element.hasPlayedGame ?? false) == widget.isPlayedGame)
      .toList();

  @override
  void didChangeDependencies() {
    _handleGifts();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ReviewGift oldWidget) {
    _exchangeProceeds.clear();
    _gifts.clear();
    _handleGifts();
    super.didUpdateWidget(oldWidget);
  }

  void _handleGifts() {
    widget.exchanges.forEach((exchange) {
      final schemeExchange = schemeExchanges.firstWhereOrNull(
          (element) => element.id == exchange.featureSchemeExchangeId);

      if (schemeExchange != null) {
        final gifts = (schemeExchange.exchangeProceeds ?? []).map((e) =>
            e.copyWith(
                quantity: e.quantity! * exchange.quantity!,
                hasPlayedGame: schemeExchange.hasPlayedGame));
        _exchangeProceeds.addAll(gifts);
      }
    });

    _exchangeProceeds.forEachIndexed((index, element) {
      if (element.product != null) {
        _gifts[(
          element.product,
          element.productPackaging,
          element.hasPlayedGame
        )] = (_gifts[(
                  element.product,
                  element.productPackaging,
                  element.hasPlayedGame
                )] ??
                0) +
            element.quantity!;
      } else {
        _gifts[(element.item, element.hasPlayedGame)] =
            (_gifts[(element.item, element.hasPlayedGame)] ?? 0) +
                element.quantity!;
      }
    });
    total = _gifts.entries
        .fold(0, (previousValue, element) => previousValue + element.value);
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
              widget.title,
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
            (
              final Product product,
              final ProductPackaging _,
              final bool? hasPlayedGame
            ) =>
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: product.name ?? '',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.black),
                      children: [
                        if (hasPlayedGame == true)
                          TextSpan(
                              text: ' (Quà game)',
                              style: context.textTheme.caption2
                                  ?.copyWith(color: '0043CE'.toColor()))
                      ]),
                ),
              ),
            (final Item gift, final bool? hasPlayedGame) => Expanded(
                child: RichText(
                  text: TextSpan(
                      text: gift.name ?? '',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.black),
                      children: [
                        if (hasPlayedGame == true)
                          TextSpan(
                              text: ' (Quà game)',
                              style: context.textTheme.caption2
                                  ?.copyWith(color: '0043CE'.toColor()))
                      ]),
                ),
              ),
            Object() => SizedBox(),
            null => SizedBox(),
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
