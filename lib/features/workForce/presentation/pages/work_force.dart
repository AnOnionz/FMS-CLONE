import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/routes/routes.dart';

class WorkForcePage extends StatelessWidget {
  const WorkForcePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _logoSize = Size(140.h, 140.h);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(context.screenWidth, 40.h),
            child: AppBar(
                backgroundColor: AppColors.transparent,
                forceMaterialTransparency: true,
                leadingWidth: 60.h,
                leading: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.h)),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: SvgPicture.asset(
                          AppIcons.back,
                        ),
                      ),
                    ),
                  ),
                ))),
        backgroundColor: AppColors.aliceBlue,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Image.asset(AppImages.logo),
              Padding(
                padding: Fx.pV16,
                child: Text(context.language.appName,
                    style: context.textTheme.h1, textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Text(
                  context.language.loginDescription,
                  style: context.textTheme.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 22.h),
                  child: DecoratedBox(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 27.h),
                            child: SizedBox(
                              width: _logoSize.width,
                              height: _logoSize.height,
                              child: CircleAvatar(
                                radius: _logoSize.width,
                                child: FlutterLogo(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: Fx.pV32,
                            child: Divider(
                              height: 1.11,
                              indent: 42.5.w,
                              endIndent: 42.5.w,
                              color: AppColors.solitude,
                            ),
                          ),
                          Padding(
                            padding: Fx.pH20,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () => context
                                        .nextRoute(Routes.projectSelection),
                                    child: Padding(
                                      padding: Fx.pV16,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.document),
                                          SizedBox(width: 8.w),
                                          Text(
                                            'Chọn dự án',
                                            style: context.textTheme.button2
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
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: Fx.pV16,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppImages.qr,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            'QR Booth',
                                            style: context.textTheme.button2
                                                ?.copyWith(
                                                    color: AppColors.orange),
                                          ),
                                        ],
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      side: MaterialStatePropertyAll<
                                              BorderSide>(
                                          BorderSide(color: AppColors.orange)),
                                      shape: MaterialStatePropertyAll<
                                              OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50.squared))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(25.w, 30.h, 25.w, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trần nhật tường',
                                    style: context.textTheme.h3,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'MA00001',
                                    style: context.textTheme.caption1,
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.location),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        '123 Bình Lợi, Bình Thạnh, HCM',
                                        style: context.textTheme.caption1,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.phone),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Text(
                                        '0909090909',
                                        style: context.textTheme.caption1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(25.w, 30.h, 25.w, 30.h),
                            child: SizedBox(
                              width: context.screenWidth,
                              child: TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: Fx.pV16,
                                  child: Text(
                                    'Nghỉ phép',
                                    style: context.textTheme.button2
                                        ?.copyWith(color: AppColors.white),
                                  ),
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll<
                                            OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                50.squared))),
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            AppColors.solitude)),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.squared))),
                ),
              ),
            ],
          ),
        ));
  }
}
