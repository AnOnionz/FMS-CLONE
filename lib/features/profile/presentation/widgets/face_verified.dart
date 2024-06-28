import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/profile/mixin_user.dart';

class FaceVerifiedWidget extends StatefulWidget {
  const FaceVerifiedWidget({super.key});

  @override
  State<FaceVerifiedWidget> createState() => _FaceVerifiedWidgetState();
}

class _FaceVerifiedWidgetState extends State<FaceVerifiedWidget>
    with UserMixin {
  @override
  Widget build(BuildContext context) {
    if (!(user!.isFaceVerified ?? false)) {
      return Container(
        margin: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 33.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sqr),
            color: AppColors.white),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    'Tài khoản chưa được cập nhật hình ảnh xác thực gương mặt ',
                style:
                    context.textTheme.body1?.copyWith(color: AppColors.black),
                children: [
                  TextSpan(
                    text: 'cập nhật ngay',
                    style: context.textTheme.body1?.copyWith(
                        color: AppColors.orange,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print(2313232);
                      },
                  )
                ])),
      );
    }
    return SizedBox();
  }
}
