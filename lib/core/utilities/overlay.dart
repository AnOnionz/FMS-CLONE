import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fms/core/constant/icons.dart';
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
      {required String msg,
      required String title,
      required BuildContext context}) async {
    final fToast = FToast();
    fToast.init(context);
    fToast.removeCustomToast();
    fToast.showToast(
        child: CustomToast(
          title: title,
          message: msg,
          onClose: () => fToast.removeCustomToast(),
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            bottom: 10.h,
            left: 16.w,
          );
        });
  }
}

class CustomToast extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClose;
  const CustomToast(
      {super.key,
      required this.message,
      required this.title,
      required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth - 32.w,
      padding: EdgeInsets.fromLTRB(20.w, 10.w, 10.w, 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sqr),
        border: Border.all(color: 'F4B0A1'.toColor()),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 16,
              color: '100B27'.toColor(0.08))
        ],
        color: 'FFF5F3'.toColor(),
      ),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: onClose,
                  child: SvgPicture.asset(AppIcons.closeToast))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.noInternet),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: context.textTheme.h3
                            ?.copyWith(color: '27303A'.toColor())),
                    SizedBox(height: 4.h),
                    Text(message,
                        style: context.textTheme.body1
                            ?.copyWith(color: '2F3F53'.toColor())),
                  ],
                ),
              )
            ],
          ),
        ],
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
