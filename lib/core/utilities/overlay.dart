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
    required String message,
    VoidCallback? solution,
  }) async {
    await showAppDialog(
      barrierDismissible: false,
      builder: (context) => ServiceDialog(
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
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 30.h,
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
                context.textTheme.subtitle1?.copyWith(color: AppColors.orange)),
      ),
    );
  }
}

class ServiceDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onSolution;
  final VoidCallback onClose;
  const ServiceDialog(
      {super.key,
      required this.message,
      required this.onSolution,
      required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Text(message),
      actions: [
        ...onSolution != null
            ? [
                TextButton(
                    onPressed: () {
                      onClose();
                      onSolution?.call();
                    },
                    child: Text('Cài đặt'))
              ]
            : [],
        ...[TextButton(onPressed: onClose, child: Text('Đóng'))]
      ],
    );
  }
}
