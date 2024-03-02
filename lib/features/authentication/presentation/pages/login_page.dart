import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.aliceBlue,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
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
              Padding(
                padding: Fx.pH20,
                child: Image.asset(
                  AppImages.loginBanner,
                ),
              ),
              const Spacer(),
              Padding(
                padding: Fx.pH32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 106.sp,
                        height: 1,
                        decoration: BoxDecoration(color: AppColors.nobel)),
                    Text(
                      context.language.loginText,
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.nobel),
                    ),
                    Container(
                        width: 106.sp,
                        height: 1,
                        decoration: BoxDecoration(color: AppColors.nobel))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 24.h),
                child: SizedBox(
                    width: context.screenSize.width,
                    child: FlatButton(
                        onPressed: () => context.nextRoute(Routes.workForce),
                        name: context.language.loginButtonText,
                        color: AppColors.orange)
                    // TextButton(
                    //   onPressed: () {
                    //     context.nextRoute(Routes.workForce);
                    //   },
                    //   child: Padding(
                    //     padding: Fx.pV16,
                    //     child: Text(
                    //       textScaler: TextScaler.linear(1),
                    //       context.language.loginButtonText,
                    //       style: context.textTheme.button2
                    //           ?.copyWith(color: AppColors.white),
                    //     ),
                    //   ),
                    //   style: ButtonStyle(
                    //       shape: MaterialStatePropertyAll<OutlinedBorder>(
                    //           RoundedRectangleBorder(
                    //               borderRadius:
                    //                   BorderRadius.circular(50.squared))),
                    //       backgroundColor:
                    //           MaterialStatePropertyAll<Color>(AppColors.orange)),
                    // ),

                    ),
              )
            ],
          ),
        ));
  }
}
