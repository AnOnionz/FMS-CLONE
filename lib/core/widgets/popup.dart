import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/home/home_module.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';
import '../utilities/overlay.dart';
import 'bottom_sheet_notification.dart';
import 'button/outline.dart';

void showSuccess({required String title}) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.success),
          title: title,
          action: OutlineButton(
              onPressed: () =>
                  Modular.to.popUntil(ModalRoute.withName(HomeModule.route)),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}

void showFailure({
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
                  return Padding(
                    padding: EdgeInsets.only(bottom: 32.h),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.nero),
                    ),
                  );
                })
              : null,
          action: OutlineButton(
              onPressed: () {
                OverlayManager.hide();
                onPressed();
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
                  return Padding(
                    padding: EdgeInsets.only(bottom: 32.h),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.nero),
                    ),
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
