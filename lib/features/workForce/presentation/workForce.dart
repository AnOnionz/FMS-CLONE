import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class WorkForcePage extends StatelessWidget {
  const WorkForcePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _logoSize = Size(140.h, 140.h);
    return Scaffold(
        backgroundColor: AppColors.aliceBlue,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
              ),
              Image.asset(AppImages.logo),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
                child: Text(context.language.appName,
                    style: context.textTheme.h1, textAlign: TextAlign.center),
              ),
              Text(
                context.language.loginDescription,
                style: context.textTheme.body1,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: DecoratedBox(
                    child: Column(children: [
                      SizedBox(width: context.screenWidth),
                      SizedBox(
                        width: _logoSize.width,
                        height: _logoSize.height,
                        child: CircleAvatar(
                          radius: _logoSize.width,
                          child: FlutterLogo(),
                        ),
                      ),
                      Padding(
                        padding: Fx.pV24,
                        child: Divider(
                          height: 1.11,
                          indent: 42.5,
                          endIndent: 42.5,
                          color: AppColors.solitude,
                        ),
                      ),
                      Padding(
                        padding: Fx.pH20,
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: Fx.pV16,
                                  child: Row(
                                    children: [
                                      Image.asset(AppImages.document),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Chọn dự án',
                                        style: context.textTheme.button2
                                            ?.copyWith(color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll<
                                            OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.dp))),
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
                                      Image.asset(AppImages.qr),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'QR Booth',
                                        style: context.textTheme.button2
                                            ?.copyWith(color: AppColors.orange),
                                      ),
                                    ],
                                  ),
                                ),
                                style: ButtonStyle(
                                  side: MaterialStatePropertyAll<BorderSide>(
                                      BorderSide(color: AppColors.orange)),
                                  shape: MaterialStatePropertyAll<
                                          OutlinedBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.dp))),
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
                              Text(
                                'MA00001',
                                style: context.textTheme.h3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.w, 30.h, 25.w, 0),
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
                                shape: MaterialStatePropertyAll<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.dp))),
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        AppColors.solitude)),
                          ),
                        ),
                      ),
                    ]),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.dp))),
              )
            ],
          ),
        ));
  }
}
