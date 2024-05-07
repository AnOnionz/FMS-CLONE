import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/order_module.dart';
import 'package:fms/features/order/presentation/pages/product_page.dart';
import 'package:uuid/uuid.dart';

import '../../../home/domain/entities/general_item_data.dart';
import '../../../home/presentation/widgets/general_feature_widget.dart';
import '../widgets/custom_stepper.dart';
import 'customer_page.dart';
import 'receive_page.dart';
import 'review_page.dart';
import 'sampling_page.dart';

class RedeemGiftPage extends StatefulWidget {
  final GeneralFeatureData entity;
  const RedeemGiftPage({super.key, required this.entity});

  @override
  State<RedeemGiftPage> createState() => _RedeemGiftPageState();
}

class _RedeemGiftPageState extends State<RedeemGiftPage> {
  final NetworkTimeService _networkTimeService =
      Modular.get<NetworkTimeService>();
  PageController controller = PageController();
  late OrderEntity orderEntity;

  late int _curr = 0;

  @override
  void initState() {
    _createOrder();
    super.initState();
  }

  Future<void> _createOrder() async {
    final time = await _networkTimeService.ntpDateTime();
    orderEntity = OrderEntity(dataUuid: Uuid().v1(), dataTimestamp: time);
  }

  late List<Widget> _body = <Widget>[
    RedeemGiftCustomerPage(
      key: PageStorageKey('customer'),
      feature: widget.entity.feature,
      onBack: onBack,
      onNext: () {
        if (orderEntity.customerInfos == null) {
          steps[_curr].setState(StepperState.ignored);
        } else {
          steps[_curr].setState(StepperState.completed);
        }
        onNext();
      },
      onSaveData: (customers) {
        setState(() {
          orderEntity = orderEntity.copyWith(customerInfos: customers);
        });
      },
    ),
    RedeemGiftProductPage(
      key: PageStorageKey('product'),
      onBack: () {
        steps[_curr].resetState();
        onBack();
      },
      onNext: onNext,
    ),
    RedeemGiftReceivePage(
      key: PageStorageKey('receive'),
      onBack: onBack,
      onNext: onNext,
    ),
    RedeemGiftSamplingPage(
      key: PageStorageKey('sampling'),
      onNext: onNext,
    ),
    RedeemGiftReviewPage(
      key: PageStorageKey('review'),
      onNext: () => context.nextRoute(OrderModule.success),
    )
  ];

  final List<StepData> steps = [
    StepData(name: 'K.Hàng', state: StepperState.editing),
    StepData(name: 'Sản phẩm'),
    StepData(name: 'Đổi quà'),
    StepData(name: 'Sampling'),
    StepData(name: 'Chụp hình')
  ];

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
        resizeToAvoidBottomInset: true,
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
          action: TextButton(
              onPressed: () => showWarning(
                  title: 'Xác nhận bỏ qua bước này',
                  message: 'Thông tin sẽ không được ghi nhận',
                  icon: SvgPicture.asset(AppIcons.requestSkip),
                  btnText: 'Bỏ qua',
                  onPressed: () {
                    steps[_curr].setState(StepperState.ignored);
                    onNext();
                  }),
              child: Text('Skip')),
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
                  steps: steps,
                  current: _curr,
                  ignoredColor: 'FFC737'.toColor(),
                  primaryColor: '0043CE'.toColor(),
                )),
            Expanded(
                child: GeneralFeature(
              generalFeatureData: widget.entity,
              child: PageView(
                children: _body,
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (num) {
                  setState(() {
                    _curr = num;
                    steps[_curr].setState(StepperState.editing);
                  });
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
