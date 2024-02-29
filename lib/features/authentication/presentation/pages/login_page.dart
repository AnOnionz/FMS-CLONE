import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Spacer(),
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
                    decoration: BoxDecoration(color: AppColors.black)),
                Text(context.language.loginText),
                Container(
                    width: 106.sp,
                    height: 1,
                    decoration: BoxDecoration(color: AppColors.black))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 26.h),
            child: SizedBox(
              width: context.screenSize.width,
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: Fx.pV16,
                  child: Text(
                    textScaler: TextScaler.linear(1),
                    context.language.loginButtonText,
                    style: context.textTheme.button2
                        ?.copyWith(color: AppColors.white),
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.dp))),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(AppColors.orange)),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
