import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/routes/routes.dart';

import '../widgets/custom_stepper.dart';

class RedeemGiftPage extends StatelessWidget {
  const RedeemGiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        onBack: () => context.navigate(Routes.home),
        title: 'Ghi nhận thông tin khách hàng',
      ),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 26.h, 16.w, 12.h),
              child: CustomStepper(
                steps: [
                  StepData(name: 'Sản phẩm', route: Routes.product),
                  StepData(name: 'Khách hàng', route: Routes.customer),
                  StepData(name: 'Đổi quà', route: Routes.receive),
                  StepData(name: 'Sampling', route: Routes.sampling),
                  StepData(name: 'Kiểm tra', route: Routes.review)
                ],
              ),
            ),
            Expanded(child: RouterOutlet()),
          ],
        ),
      ),
    );
  }
}
