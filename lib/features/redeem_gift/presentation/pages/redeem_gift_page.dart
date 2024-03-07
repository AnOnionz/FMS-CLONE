import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';

import '../widgets/custom_stepper.dart';

class RedeemGiftPage extends StatelessWidget {
  const RedeemGiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Ghi nhận thông tin khách hàng',
      ),
      body: SafeArea(
          child: Column(
        children: [
          NavigationListener(
            builder: (BuildContext context, Widget? child) {
              return Padding(
                padding: EdgeInsets.fromLTRB(16.w, 26.h, 16.w, 12.h),
                child: CustomStepper(
                  steps: [
                    StepData(name: 'Sản phẩm'),
                    StepData(name: 'Khách hàng'),
                    StepData(name: 'Đổi quà'),
                    StepData(name: 'Sampling'),
                    StepData(name: 'Kiểm tra')
                  ],
                ),
              );
            },
          ),
          Expanded(child: RouterOutlet()),
        ],
      )),
    );
  }
}
