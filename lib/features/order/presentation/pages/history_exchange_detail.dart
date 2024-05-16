import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';

import '../widgets/exchange_detail.dart';

class HistoryExchangeDetailPage extends StatelessWidget {
  final OrderEntity order;
  final FeatureEntity feature;

  const HistoryExchangeDetailPage({
    super.key,
    required this.order,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Lịch sử đơn hàng',
        action: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(AppIcons.edit),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: ExchangeDetail(
          order: order,
          feature: feature,
          isHistory: true,
        ),
      ),
    );
  }
}
