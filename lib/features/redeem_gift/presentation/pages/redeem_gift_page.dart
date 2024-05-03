import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/redeem_gift/presentation/pages/product_page.dart';
import 'package:fms/features/redeem_gift/redeem_gift_module.dart';

import '../../../home/domain/entities/general_item_data.dart';
import '../widgets/custom_stepper.dart';
import 'customer_page.dart';
import 'receive_page.dart';
import 'review_page.dart';
import 'sampling_page.dart';

class RedeemGiftPage extends StatefulWidget {
  final GeneralItemData entity;
  const RedeemGiftPage({super.key, required this.entity});

  @override
  State<RedeemGiftPage> createState() => _RedeemGiftPageState();
}

class _RedeemGiftPageState extends State<RedeemGiftPage> {
  PageController controller = PageController();
  int _curr = 0;
  late List<Widget> _body = <Widget>[
    RedeemGiftCustomerPage(
      key: PageStorageKey('customer'),
      feature: widget.entity.feature,
      onNext: onNext,
    ),
    RedeemGiftProductPage(
      key: PageStorageKey('product'),
      onNext: onNext,
    ),
    RedeemGiftReceivePage(
      key: PageStorageKey('receive'),
      onNext: onNext,
    ),
    RedeemGiftSamplingPage(
      key: PageStorageKey('sampling'),
      onNext: onNext,
    ),
    RedeemGiftReviewPage(
      key: PageStorageKey('review'),
      onNext: () => context.nextRoute(RedeemGiftModule.success),
    )
  ];

  List<StepData> get steps => [
        StepData(name: 'Khách hàng'),
        StepData(name: 'Sản phẩm'),
        StepData(name: 'Đổi quà'),
        StepData(name: 'Sampling'),
        StepData(name: 'Kiểm tra')
      ];

  void onNext() {
    controller.nextPage(duration: 500.milliseconds, curve: Curves.ease);
  }

  void onPrevius() {
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
          onBack: () => context.popUntil(HomeModule.route),
          title: widget.entity.feature.name!,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 26.h, 16.w, 12.h),
              child: CustomStepper(steps: steps, current: _curr),
            ),
            Expanded(
                child: PageView(
              children: _body,
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (num) {
                setState(() {
                  _curr = num;
                });
              },
            )),
          ],
        ),
      ),
    );
  }
}
