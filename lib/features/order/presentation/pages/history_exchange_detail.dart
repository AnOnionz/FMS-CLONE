import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/connectivity/connectivity_service.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/history_exchange_module.dart';

import '../../../../core/widgets/popup.dart';
import '../../../general/presentation/page/mixin_general.dart';
import '../widgets/exchange_detail.dart';

class HistoryExchangeDetailPage extends StatefulWidget {
  final OrderEntity order;
  final FeatureEntity feature;

  const HistoryExchangeDetailPage({
    super.key,
    required this.order,
    required this.feature,
  });

  @override
  State<HistoryExchangeDetailPage> createState() =>
      _HistoryExchangeDetailPageState();
}

class _HistoryExchangeDetailPageState extends State<HistoryExchangeDetailPage>
    with GeneralDataMixin {
  late OrderEntity _order = widget.order;
  final _network = Modular.get<ConnectivityService>();
  bool isUpdateSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        onBack: () => context.pop(isUpdateSuccess),
        title: 'Lịch sử đơn hàng',
        action: _order.status == SyncStatus.synced
            ? GestureDetector(
                onTap: () async {
                  if (!_network.hasConnected) {
                    showInternetFailure();
                    return;
                  }
                  final a = await context.nextRoute(HistoryExchangeModule.edit,
                      arguments: [
                        GeneralFeatureData(
                            general: general, feature: widget.feature),
                        _order
                      ]);
                  if (a != null) {
                    setState(() {
                      _order = a as OrderEntity;
                      isUpdateSuccess = true;
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: SvgPicture.asset(AppIcons.edit),
                ))
            : null,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: ExchangeDetail(
          order: _order,
          feature: widget.feature,
          isHistory: true,
        ),
      ),
    );
  }
}
