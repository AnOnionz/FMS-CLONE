import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/colors.dart';
import '../widgets/custom_bottom_sheet.dart';
import '/core/widgets/loading_alert.dart';

final class OverlayManager {
  static BuildContext? get currentContext =>
      Modular.routerDelegate.navigatorKey.currentContext;

  OverlayManager._();

  static void hide() => Modular.to.pop();

  static Future<void> showLoading({String? message}) async {
    await showAppDialog(
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: LoadingAlert(
          message: message ?? 'Vui lòng đợi...',
        ),
      ),
    );
  }

  static dynamic showSheet({required Widget body}) async {
    return showModalBottomSheet(
        context: currentContext!,
        isScrollControlled: true,
        elevation: 2.0,
        constraints: BoxConstraints(
            maxHeight: currentContext!.screenHeight -
                currentContext!.screenPadding.top -
                68.h),
        builder: (context) {
          return CustomBottomSheet(
            child: body,
          );
        });
  }

  static Future<void> showAppDialog(
      {required WidgetBuilder builder, bool barrierDismissible = true}) async {
    await showDialog(
      context: currentContext!,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  static Future<void> showServiceDialog({
    String? title,
    String? message,
    VoidCallback? solution,
  }) async {
    await showAppDialog(
      barrierDismissible: false,
      builder: (context) => ServiceDialog(
        title: title,
        message: message,
        onSolution: solution,
        onClose: () => hide(),
      ),
    );
  }

  static Future<void> showSnackbar({required SnackBar snackbar}) async {
    ScaffoldMessenger.of(currentContext!).clearSnackBars();
    ScaffoldMessenger.of(currentContext!).showSnackBar(snackbar);
  }

  static Future<void> showToast(
      {required String msg, required BuildContext context}) async {
    final fToast = FToast();
    fToast.init(context);
    fToast.removeCustomToast();
    fToast.showToast(
        child: CustomToast(
          message: msg,
        ),
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: 4),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 40.h,
            left: 32.w,
          );
        });
  }
}

class CustomToast extends StatelessWidget {
  final String message;
  const CustomToast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth - 64.w,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.nobel,
      ),
      child: Center(
        child: Text(message,
            style:
                context.textTheme.subtitle1?.copyWith(color: AppColors.white)),
      ),
    );
  }
}

class ServiceDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback? onSolution;
  final VoidCallback onClose;
  const ServiceDialog(
      {super.key,
      this.title,
      this.message,
      required this.onSolution,
      required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: message != null ? Text(message!) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentTextStyle:
          context.textTheme.subtitle1?.copyWith(color: AppColors.black),
      titleTextStyle: context.textTheme.h2?.copyWith(color: AppColors.black),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      titlePadding: EdgeInsets.only(top: 24, bottom: 8, left: 16, right: 16),
      actionsPadding: EdgeInsets.only(bottom: 16),
      backgroundColor: AppColors.white,
      actions: [
        ...[
          TextButton(
              onPressed: onClose,
              child: Text(
                'Đóng',
                style: context.textTheme.caption1
                    ?.copyWith(color: AppColors.black),
              ))
        ],
        ...onSolution != null
            ? [
                TextButton(
                    onPressed: () {
                      onClose();
                      onSolution?.call();
                    },
                    child: Text(
                      'Mở cài đặt',
                      style: context.textTheme.caption1
                          ?.copyWith(color: AppColors.royalBlue),
                    ))
              ]
            : [],
      ],
    );
  }
}
