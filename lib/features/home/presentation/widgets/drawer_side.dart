import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/home/presentation/widgets/notifications.dart';
import 'package:fms/routes/routes.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Drawer(
                backgroundColor: AppColors.white.withOpacity(0.56),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.squared),
                    side: BorderSide(color: AppColors.white.withOpacity(0.4))),
                shadowColor: AppColors.black.withOpacity(0.2),
                child: SafeArea(
                  child: Stack(
                    children: [
                      CustomScrollView(
                        physics: BouncingScrollPhysics(
                            parent: ClampingScrollPhysics()),
                        slivers: [
                          SliverList.list(children: [
                            SizedBox(
                              height: context.screenHeight -
                                  context.screenPadding.top -
                                  context.screenPadding.bottom,
                              child: DefaultTextStyle(
                                style: context.textTheme.subtitle1!
                                    .copyWith(color: AppColors.blackRussian),
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
                                    _rowFeature(
                                      context,
                                      AppIcons.notification,
                                      'Thông báo',
                                      Routes.setting,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowFeature(
                                      context,
                                      AppIcons.about,
                                      'Thông tin và ứng dụng',
                                      Routes.appInformation,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowFeature(
                                      context,
                                      AppIcons.config,
                                      'Cài đặt',
                                      Routes.setting,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.h),
                                      child: Divider(
                                        color: AppColors.black.withOpacity(0.1),
                                        endIndent: 30.w,
                                      ),
                                    ),
                                    _rowInfo(context, 'Ứng dụng', 'FMS 2023'),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowInfo(context, 'Dự án', 'CellphoneS'),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowInfo(context, 'Phiên bản', '2.0.1'),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 20.h,
                                      ),
                                      child: GestureDetector(
                                        onTap: () => showRequiredTask(context),
                                        child: Container(
                                          height: 56.h,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 11.h),
                                          decoration: BoxDecoration(
                                              color: AppColors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50.squared)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 11.h),
                                                child: SvgPicture.asset(
                                                    AppIcons.logout),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 24.w, left: 21.w),
                                                child: Text(
                                                  'ĐĂNG XUẤT',
                                                  style: context
                                                      .textTheme.button1
                                                      ?.copyWith(
                                                          color:
                                                              AppColors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
        ),
        Positioned(
            top: 40.h,
            left: -20.h,
            child: GestureDetector(
              onTap: () => Scaffold.of(context).closeEndDrawer(),
              child: Container(
                height: 47.h,
                width: 47.h,
                child: Center(
                    child: SvgPicture.asset(
                  AppIcons.closeDrawer,
                  height: 24.h,
                )),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-4, 0),
                          blurRadius: 60,
                          color: AppColors.black.withOpacity(0.2))
                    ]),
              ),
            ))
      ],
    );
  }

  Widget _rowInfo(BuildContext context, String left, String right) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 32.w),
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

  Widget _rowFeature(
      BuildContext context, String icon, String name, String route) {
    return GestureDetector(
      onTap: () {
        context.nextRoute(route);
        Scaffold.of(context).closeEndDrawer();
      },
      child: ColoredBox(
        color: AppColors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 32.w),
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
      ),
    );
  }
}
