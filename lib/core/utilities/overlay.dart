import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../widgets/custom_bottom_sheet.dart';
import '/core/widgets/loading_alert.dart';

class OverlayManager {
  static BuildContext? get currentContext =>
      Modular.routerDelegate.navigatorKey.currentContext;

  late FToast fToast;

  OverlayManager({required BuildContext context}) {
    fToast = FToast();
    fToast.init(context);
  }

  static void hide() => Modular.to.pop();

  static Future<void> showLoading({String? message}) async {
    await showAppDialog(
      barrierDismissible: false,
      builder: (context) => LoadingAlert(
        message: message ?? 'Loading',
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

  static Future<void> showSnackbar({required SnackBar snackbar}) async {
    ScaffoldMessenger.of(currentContext!).clearSnackBars();
    ScaffoldMessenger.of(currentContext!).showSnackBar(snackbar);
  }

  Future<void> showToast({required String msg}) async {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
