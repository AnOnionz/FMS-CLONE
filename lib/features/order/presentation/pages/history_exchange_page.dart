import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/presentation/cubit/history_exchange_cubit.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../../../../core/widgets/popup.dart';
import '../../../home/domain/entities/general_item_data.dart';
import '../../history_exchange_module.dart';
import '../widgets/history/history_exchange_simplify_item.dart';

class HistoryExchangePage extends StatefulWidget {
  final GeneralFeatureData entity;
  const HistoryExchangePage({super.key, required this.entity});

  @override
  State<HistoryExchangePage> createState() => _HistoryExchangePageState();
}

class _HistoryExchangePageState extends State<HistoryExchangePage> {
  final _cubit = Modular.get<HistoryExchangeCubit>();

  @override
  void initState() {
    fetchOrders();
    super.initState();
  }

  void fetchOrders() {
    _cubit.loadAllExchangeHistory(
        featureExchangeId:
            (widget.entity.feature as EmbeddedFeatureEntity).feature.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Lịch sử đơn hàng'),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.fromLTRB(16.w, 30.h, 16.w, 8.h),
            //   child: DatePicker(
            //     fillColor: AppColors.aliceBlue,
            //   ),
            // ),
            Expanded(
              child: BlocConsumer<HistoryExchangeCubit, HistoryExchangeState>(
                bloc: _cubit,
                listener: (context, state) {
                  if (state is HistoryExchangeFailure) {
                    showFailure(
                      title: 'Tải dữ liệu thất bại',
                      icon: SvgPicture.asset(AppIcons.failure),
                      message: state.failure.message,
                      btnText: 'Thử lại',
                      onPressed: () async {
                        await Future.delayed(
                          300.milliseconds,
                          () => fetchOrders(),
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  if (state is HistoryExchangeSuccess) {
                    if (state.orders.isEmpty) {
                      return Center(
                          child: Text('Không có dữ liệu',
                              style: context.textTheme.body1));
                    }
                    return ListView.builder(
                      itemCount: state.orders.length,
                      physics: kPhysics,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () async {
                          await context.nextRoute(
                              HistoryExchangeModule.historyDetail,
                              arguments: [
                                (widget.entity.feature as EmbeddedFeatureEntity)
                                    .feature,
                                state.orders[index]
                              ]);
                          fetchOrders();
                        },
                        child: HistoryExchangeSimplifyItem(
                            order: state.orders[index],
                            feature:
                                widget.entity.feature as EmbeddedFeatureEntity),
                      ),
                    );
                  }
                  if (state is HistoryExchangeFailure) {
                    return Center(
                      child:
                          DataLoadErrorWidget(onPressed: () => fetchOrders()),
                    );
                  }
                  return Center(child: AppIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
