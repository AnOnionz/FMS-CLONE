import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: Drawer(
            backgroundColor: AppColors.white.withOpacity(0.56),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.h),
                side: BorderSide(color: AppColors.white.withOpacity(0.4))),
            shadowColor: AppColors.black.withOpacity(0.2),
            child: SafeArea(
              child: Stack(
                children: [
                  CustomScrollView(
                    physics:
                        BouncingScrollPhysics(parent: ClampingScrollPhysics()),
                    slivers: [
                      SliverList.list(children: [
                        SizedBox(
                          height: context.screenHeight -
                              context.screenPadding.top -
                              context.screenPadding.bottom,
                          child: DefaultTextStyle(
                            style: context.textTheme.subtitle1!
                                .copyWith(color: AppColors.blackRussian),
                            child: Padding(
                              padding: Fx.pH32,
                              child: Column(
                                children: [
                                  FlutterLogo(size: 60),
                                  SizedBox(height: 20.h),
                                  Text(
                                    'Trần Nhật Tường',
                                    style: context.textTheme.subtitle1
                                        ?.copyWith(color: AppColors.black),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'trannhattuong@gmail.com',
                                    style: context.textTheme.body1
                                        ?.copyWith(color: AppColors.nobel),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'manv001',
                                    style: context.textTheme.body1
                                        ?.copyWith(color: AppColors.nobel),
                                  ),
                                  SizedBox(height: 48.h),
                                  rowFeature(AppIcons.notification, 'Thông báo',
                                      () {}),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  rowFeature(AppIcons.about, 'Thông tin outlet',
                                      () {}),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  rowFeature(AppIcons.config, 'Cài đặt', () {}),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 30.h),
                                    child: Divider(
                                      color: AppColors.black.withOpacity(0.1),
                                      endIndent: 30.w,
                                    ),
                                  ),
                                  rowInfo(context, 'Ứng dụng', 'FMS 2023'),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  rowInfo(context, 'Dự án', 'CellphoneS'),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  rowInfo(context, 'Phiên bản', '2.0.1'),
                                  // SizedBox(height: 200.h),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: SizedBox(
                                      width: 185.w,
                                      height: 56.h,
                                      child: TextButton(
                                        onPressed: () => context.pop(),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 11.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AppImages.logout,
                                                height: 34.h,
                                              ),
                                              SizedBox(width: 16.w),
                                              Text(
                                                'ĐĂNG XUẤT',
                                                style: context.textTheme.button1
                                                    ?.copyWith(
                                                        color: AppColors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll<
                                                    OutlinedBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.squared))),
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    AppColors.orange)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget rowInfo(BuildContext context, String left, String right) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left),
          Text(
            right,
            style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
          )
        ],
      ),
    );
  }

  Widget rowFeature(String icon, String name, Function onPressed) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: 16.w,
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
