import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/errors/failure.dart';
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
  required Failure failure,
  required String btnText,
  required VoidCallback onPressed,
}) {
  final icon = switch (failure.runtimeType) {
    SocketFailure => AppIcons.requiredInternet,
    RequiredAllTaskDoneFailure => AppIcons.requiredTask,
    RequiredSyncFailure => AppIcons.requiredSync,
    DownloadFailure => AppIcons.requiredDownload,
    _ => AppIcons.failure,
  };
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(icon),
          title: title,
          message: failure.message,
          action: OutlineButton(
              onPressed: onPressed, name: btnText, color: AppColors.orange)));
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
          message: message,
          action: FlatButton(
              onPressed: onPressed, name: btnText, color: AppColors.orange)));
}
