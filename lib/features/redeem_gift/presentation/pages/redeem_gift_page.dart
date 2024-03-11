import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/redeem_gift/presentation/pages/product_page.dart';
import 'package:fms/routes/routes.dart';

import '../widgets/custom_stepper.dart';
import 'customer_page.dart';
import 'receive_page.dart';
import 'review_page.dart';
import 'sampling_page.dart';

class RedeemGiftPage extends StatefulWidget {
  const RedeemGiftPage({super.key});

  @override
  State<RedeemGiftPage> createState() => _RedeemGiftPageState();
}

class _RedeemGiftPageState extends State<RedeemGiftPage> {
  PageController controller = PageController();
  int _curr = 0;
  late List<Widget> _list = <Widget>[
    RedeemGiftProductPage(
      key: PageStorageKey('product'),
      onNext: onNext,
    ),
    RedeemGiftCustomerPage(
      key: PageStorageKey('customer'),
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
      onNext: () => context.nextRoute(Routes.congratulation),
    )
  ];

  List<StepData> get steps => [
        StepData(name: 'Sản phẩm'),
        StepData(name: 'Khách hàng'),
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
          onBack: () => context.navigate(Routes.home),
          title: 'Ghi nhận thông tin khách hàng',
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 26.h, 16.w, 12.h),
              child: CustomStepper(steps: steps, current: _curr),
            ),
            Expanded(
                child: PageView(
              children: _list,
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
