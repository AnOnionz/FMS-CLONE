import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/matter_container.dart';

import '../../../../core/styles/theme.dart';
import '../../domain/entities/statistic_entity.dart';

class StatisticGift extends StatelessWidget {
  final int total;
  final List<ExchangeStatistic> exchanges;
  const StatisticGift(
      {super.key, required this.exchanges, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 24.w, bottom: 16.h),
            child: RichText(
                text: TextSpan(
                    text: 'Tổng số lượng quà phát ra:  ',
                    style: context.textTheme.body2
                        ?.copyWith(color: AppColors.black),
                    children: [
                  TextSpan(
                      text: total.toString(), style: context.textTheme.caption1)
                ])),
          ),
          Expanded(
              child: ListView.builder(
            physics: kPhysics,
            itemCount: exchanges.length,
            itemBuilder: (context, index) {
              final exchange = exchanges[index];

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                margin: EdgeInsets.symmetric(vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.sqr),
                ),
                child: MatterContainer(
                    leading: MatterImage(
                        url: exchange.item != null
                            ? exchange.item!.imageUrl
                            : exchange.product!.imageUrl),
                    title: MatterInfoWidget(
                      isGameReward: exchange.isGameReward ?? false,
                      product: exchange.product,
                      productPackaging: exchange.productPackaging,
                      item: exchange.item,
                      asset: exchange.item != null
                          ? exchange.item!.itemTypeName!
                          : exchange.product!.brandName!,
                    ),
                    trailing: RichText(
                        text: TextSpan(
                            text: (exchange.quantity ?? 0).toString(),
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.black),
                            children: [
                          TextSpan(
                              text:
                                  ' ${exchange.item != null ? exchange.item!.unitName : exchange.productPackaging!.unitName!}',
                              style: context.textTheme.body1
                                  ?.copyWith(color: AppColors.nobel))
                        ]))),
              );
            },
          ))
        ],
      ),
    );
  }
}
