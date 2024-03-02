import 'package:flutter/material.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/adaptive_indicator.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/button/flat.dart';

import '../../../core/constant/colors.dart';
import '../../../core/widgets/button/outline.dart';

class TimekeepingLocate extends StatefulWidget {
  const TimekeepingLocate({super.key});

  @override
  State<TimekeepingLocate> createState() => _TimekeepingLocateState();
}

class _TimekeepingLocateState extends State<TimekeepingLocate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: 'Chấm công'),
        backgroundColor: AppColors.aliceBlue,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                Container(
                  height: 300.h + 100.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          AppImages.locationBackground,
                          height: 300.h,
                          width: 300.h,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AppImages.locationLoad,
                          height: 300.h,
                        ),
                      ),
                      Align(
                          child: Padding(
                        padding: EdgeInsets.only(top: 166.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Đanh xác định vị trí của bạn'),
                            SizedBox(
                              height: 20.h,
                            ),
                            AdaptiveIndicator(
                              color: '#ABEFFF'.toColor(),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: FlatButton(
                      onPressed: () {},
                      name: 'Tiếp tục',
                      color: AppColors.orange),
                ),
                OutlineButton(
                    onPressed: () {}, name: 'Thử lại', color: AppColors.orange)
              ],
            ),
          ),
        ));
  }
}
