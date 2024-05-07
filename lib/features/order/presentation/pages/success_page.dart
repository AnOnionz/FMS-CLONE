import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/core/widgets/button/outline.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/order/order_module.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(AppImages.success),
                  SizedBox(height: 40.h),
                  Text('ĐỔI QUÀ THÀNH CÔNG', style: context.textTheme.h2),
                  SizedBox(height: 10.h),
                  Text('Cám ơn quý khách đã mua hàng',
                      style: context.textTheme.body1
                          ?.copyWith(color: '656565'.toColor())),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlineButton(
                            onPressed: () => context.popUntil(HomeModule.route),
                            name: 'Trang chủ',
                            color: AppColors.orange),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: FlatButton(
                            onPressed: () {
                              context.popUntil(HomeModule.route);
                              context.nextRoute(OrderModule.route);
                            },
                            name: 'Tiếp tục đổi quà',
                            color: AppColors.orange),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(child: Image.asset(AppImages.congratulation))
        ],
      ),
    );
  }
}
