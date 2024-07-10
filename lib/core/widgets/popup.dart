import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/home/home_module.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';
import '../utilities/overlay.dart';
import 'bottom_sheet_notification.dart';
import 'button/outline.dart';

void showSuccess(
    {required String title, Widget? icon, VoidCallback? onPressed}) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: icon ?? SvgPicture.asset(AppIcons.success),
          title: title,
          action: OutlineButton(
              onPressed: onPressed ??
                  () => Modular.to
                      .popUntil(ModalRoute.withName(HomeModule.route)),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}

void showFailure({
  required String title,
  Widget? icon,
  String? message,
  required String btnText,
  VoidCallback? onPressed,
}) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: icon ?? SvgPicture.asset(AppIcons.failure),
          title: title,
          message: message != null
              ? Builder(builder: (context) {
                  return Text(
                    message,
                    textAlign: TextAlign.center,
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nero),
                  );
                })
              : null,
          action: OutlineButton(
              onPressed: () {
                OverlayManager.hide();
                onPressed?.call();
              },
              name: btnText,
              color: AppColors.orange)));
}

void showWarning({
  required String title,
  required Widget icon,
  String? message,
  required String btnText,
  required VoidCallback onPressed,
}) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: icon,
          title: title,
          message: message != null
              ? Builder(builder: (context) {
                  return Text(
                    message,
                    textAlign: TextAlign.center,
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nero),
                  );
                })
              : null,
          action: FlatButton(
              onPressed: () {
                OverlayManager.hide();
                onPressed();
              },
              name: btnText,
              color: AppColors.orange)));
}

void showInternetFailure([VoidCallback? onPressed]) {
  showFailure(
      title: 'Không có kết nối mạng',
      icon: SvgPicture.asset(AppIcons.requiredInternet),
      message: 'Kết nối mạng không ổn định, vui lòng kiểm tra lại kết nối mạng',
      btnText: 'Ok',
      onPressed: onPressed);
}
