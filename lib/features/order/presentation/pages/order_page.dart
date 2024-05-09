import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/order_module.dart';
import 'package:fms/features/order/presentation/pages/purchase_page.dart';
import 'package:uuid/uuid.dart';

import '../../../home/domain/entities/general_item_data.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/data_feature_widget.dart';
import 'customer_page.dart';
import 'exchange_page.dart';
import 'review_page.dart';
import 'sampling_page.dart';

class OrderPage extends StatefulWidget {
  final GeneralFeatureData entity;
  const OrderPage({super.key, required this.entity});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final NetworkTimeService _networkTimeService =
      Modular.get<NetworkTimeService>();
  PageController controller = PageController();
  Completer<OrderEntity> _completer = Completer();
  late OrderEntity orderEntity;
  late List<Widget> _body = [];
  late List<StepData> _steps = [];

  late int _curr = 0;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void onNext() {
    controller.nextPage(duration: 500.milliseconds, curve: Curves.ease);
  }

  void onBack() {
    controller.previousPage(duration: 500.milliseconds, curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: DefaultAppBar(
          onBack: () => showWarning(
              title: 'Hủy đơn hàng hiện tại ?',
              message:
                  'Đơn hàng hiện tại sẽ không được ghi nhận. Bạn có chắc muốn hủy đơn này ?',
              icon: SvgPicture.asset(AppIcons.requestClose),
              btnText: 'Huỷ đơn',
              onPressed: () => context.popUntil(HomeModule.route)),
          iconBack: SvgPicture.asset(AppIcons.closeRegular),
          title: widget.entity.feature.name!,
          action: widget.entity.feature.featureOrder!.isCustomerRequired!
              ? null
              : TextButton(
                  onPressed: () => showWarning(
                      title: 'Xác nhận bỏ qua bước này',
                      message: 'Thông tin sẽ không được ghi nhận',
                      icon: SvgPicture.asset(AppIcons.requestSkip),
                      btnText: 'Bỏ qua',
                      onPressed: () {
                        _steps[_curr].setState(StepperState.ignored);
                        onNext();
                        setState(() {});
                      }),
                  child: Text(
                    'Skip',
                    style: context.textTheme.body1,
                  )),
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 22.h),
                margin: EdgeInsets.fromLTRB(16.w, 35.h, 16.w, 8.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.sqr)),
                child: CustomStepper(
                  steps: _steps,
                  current: _curr,
                  ignoredColor: 'FFC737'.toColor(),
                  primaryColor: '0043CE'.toColor(),
                )),
            if (_completer.isCompleted)
              Expanded(
                  child: DataFeature(
                data: widget.entity,
                order: orderEntity,
                child: PageView(
                  children: _body,
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (num) {
                    setState(() {
                      _curr = num;
                      _steps[_curr].setState(StepperState.editing);
                    });
                  },
                ),
              )),
          ],
        ),
      ),
    );
  }

  Future<void> _init() async {
    final time = await _networkTimeService.ntpDateTime();

    orderEntity = OrderEntity(
        dataUuid: Uuid().v1(),
        dataTimestamp: time,
        attendanceId: widget.entity.general.attendance!.id,
        featureId: widget.entity.feature.id);

    _completer.complete(orderEntity);

    if (widget.entity.feature.featureOrder?.hasCustomer == true) {
      _steps.add(
        StepData(name: 'K.Hàng', state: StepperState.editing),
      );
      _body.add(OrderCustomerPage(
        key: PageStorageKey('customer'),
        onBack: onBack,
        onNext: () {
          if (orderEntity.customerInfos == null) {
            _steps[_curr].setState(StepperState.ignored);
          } else {
            _steps[_curr].setState(StepperState.completed);
          }
          onNext();
        },
        onSaveData: (customers) {
          setState(() {
            orderEntity = orderEntity.copyWith(customerInfos: customers);
          });
          Fx.log(orderEntity);
        },
      ));
    }
    if (widget.entity.feature.featureOrder?.hasPurchase == true) {
      _steps.add(StepData(name: 'Sản phẩm'));
      _body.add(OrderPurchasePage(
        key: PageStorageKey('product'),
        onBack: () {
          _steps[_curr].resetState();
          onBack();
        },
        onNext: () {
          if (orderEntity.purchases == null) {
            _steps[_curr].setState(StepperState.ignored);
          } else {
            _steps[_curr].setState(StepperState.completed);
          }
          onNext();
        },
        onSaveData: (purchases) {
          setState(() {
            orderEntity = orderEntity.copyWith(purchases: purchases);
          });
        },
      ));
    }
    if (widget.entity.feature.featureOrder?.hasExchange == true) {
      _steps.add(StepData(name: 'Đổi quà'));
      _body.add(OrderExchangePage(
        key: PageStorageKey('exchange'),
        onBack: onBack,
        onNext: () {
          onNext();
        },
      ));
    }
    if (widget.entity.feature.featureOrder?.hasSampling == true) {
      _steps.add(StepData(name: 'Sampling'));
      _body.add(OrderSamplingPage(
        key: PageStorageKey('sampling'),
        onNext: onNext,
      ));
    }
    if (widget.entity.feature.featureOrder?.hasPhoto == true) {
      _steps.add(StepData(name: 'Chụp hình'));
      _body.add(OrderReviewPage(
        key: PageStorageKey('review'),
        onNext: () => context.nextRoute(OrderModule.success),
      ));
    }
    setState(() {});
  }
}
