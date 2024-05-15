import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/presentation/widgets/data_feature_widget.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../domain/entities/exchange_controller.dart';
import '../widgets/bottom_buttons.dart';
import '../widgets/receive/gift_quantity_widget.dart';

class OrderExchangePage extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;
  final void Function(List<ExchangeEntity> exchanges) onSaveData;
  const OrderExchangePage(
      {super.key,
      required this.onNext,
      required this.onBack,
      required this.onSaveData});

  @override
  State<OrderExchangePage> createState() => _OrderExchangePageState();
}

class _OrderExchangePageState extends State<OrderExchangePage> {
  int priceUsed = 0;
  late final dataFeature = DataFeature.of(context);
  late List<ExchangeEntity> _exchangeEntites =
      dataFeature.order.exchanges ?? <ExchangeEntity>[];

  late final ExchangeController _exchangeController = ExchangeController(
      order: dataFeature.order, feature: dataFeature.data.feature);

  late final exchanges = DataFeature.of(context)
      .data
      .feature
      .featureSchemes!
      .map((e) => e.exchanges!)
      .expand((element) => element)
      .toList();

  void _onExchangeUpdate(ExchangeEntity entity, int? price) {
    final exchangeEntity = _exchangeEntites.firstWhereOrNull(
        (e) => e.featureSchemeExchangeId == entity.featureSchemeExchangeId);
    if (exchangeEntity != null) {
      _exchangeEntites.remove(exchangeEntity);
      if (entity.quantity! > 0)
        _exchangeEntites.add(entity.copyWith(quantity: entity.quantity));
    } else {
      _exchangeEntites.add(entity);
    }

    priceUsed = _exchangeEntites
        .map((exchange) =>
            exchanges
                .firstWhereOrNull((element) =>
                    element.id! == exchange.featureSchemeExchangeId &&
                    exchange.quantity! > 0)
                ?.reachAmount ??
            0)
        .fold(0, (previousValue, price) => previousValue + price);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
          margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.sqr),
                  topRight: Radius.circular(10.sqr))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đổi quà',
                      style: context.textTheme.subtitle1,
                    ),
                    SvgPicture.asset(AppIcons.help)
                  ],
                ),
              ),
              Expanded(
                  child: CustomScrollView(
                key: UniqueKey(),
                physics: RangeMaintainingScrollPhysics(
                    parent: ClampingScrollPhysics()),
                slivers: [
                  // SliverToBoxAdapter(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.only(bottom: 16.h),
                  //         child: RichText(
                  //             text: TextSpan(
                  //                 text: 'Số lượng quà khách có thể đổi là ',
                  //                 style: context.textTheme.body1
                  //                     ?.copyWith(color: AppColors.dimGray),
                  //                 children: [
                  //               TextSpan(
                  //                   text: '5',
                  //                   style: context.textTheme.body1?.copyWith(
                  //                       color: AppColors.fireBrick,
                  //                       fontWeight: FontWeight.w600))
                  //             ])),
                  //       ),
                  //       Divider(
                  //         color: AppColors.whisper,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    sliver: SliverList.separated(
                      itemCount: exchanges.length,
                      itemBuilder: (context, index) => GiftQuantityWidget(
                        value: _exchangeEntites
                                .firstWhereOrNull((element) =>
                                    element.featureSchemeExchangeId! ==
                                    exchanges[index].id!)
                                ?.quantity ??
                            0,
                        controller: _exchangeController,
                        products:
                            dataFeature.data.feature.featureOrder!.products!,
                        exchange: exchanges[index],
                        onQuantityChanged: _onExchangeUpdate,
                        priceUsed: priceUsed,
                      ),
                      separatorBuilder: (context, index) => Divider(
                        color: AppColors.whisper,
                      ),
                    ),
                  )
                ],
              )),
            ],
          ),
        )),
        Container(
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 25,
                color: AppColors.black.withOpacity(0.15))
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BottomButtons(
              onBack: widget.onBack,
              onNext: _exchangeEntites.any((exchange) => exchange.quantity! > 0)
                  ? () {
                      widget.onSaveData(_exchangeEntites);
                      widget.onNext();
                    }
                  : null,
            ),
          ),
        )
      ],
    );
  }

  // @override
  // bool get wantKeepAlive => true;
}
