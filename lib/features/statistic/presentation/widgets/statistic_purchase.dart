import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/matter_container.dart';

import '../../../../core/styles/theme.dart';

import '../../domain/entities/statistic_entity.dart';

class StatisticPurchase extends StatelessWidget {
  final int total;
  final List<PurchaseStatistic> purchases;
  const StatisticPurchase(
      {super.key, required this.purchases, required this.total});

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
                    text: 'Tổng sản lượng: ',
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
            itemCount: purchases.length,
            itemBuilder: (context, index) {
              final purchase = purchases[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                margin: EdgeInsets.symmetric(vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.sqr),
                ),
                child: MatterContainer(
                    leading: MatterImage(url: purchase.product!.imageUrl),
                    title: MatterInfoWidget(
                      product: purchase.product!,
                      productPackaging: purchase.productPackaging!,
                      asset: purchase.product!.brandName!,
                    ),
                    trailing: RichText(
                        text: TextSpan(
                            text: (purchase.quantity ?? 0).toString(),
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.black),
                            children: [
                          TextSpan(
                              text: ' ${purchase.productPackaging!.unitName!}',
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
