import 'package:flutter/material.dart';
import 'package:fms/core/constant/fonts.dart';
import 'package:fms/core/mixins/fx.dart';

final class AppIconData extends IconData {
  const AppIconData(int codePoint)
      : super(
          codePoint,
          fontFamily: AppFonts.icon,
        );
}

/// [IconlyBold] for style Bold Icons
///
/// List Iconly Bold
///
class AppIcons {
  AppIcons._();

  static const IconData next = AppIconData(0xe900);
  static String back = 'back'.icon.svg;
  static String closeDrawer = 'close_drawer'.icon.svg;
  static String document = 'document'.icon.svg;
  static String qr = 'qr'.icon.svg;
  static String location = 'location'.icon.svg;
  static String phone = 'phone'.icon.svg;
  static String circleUser = 'circle_user'.icon.svg;
  static String report = 'report'.icon.svg;
  static String statistic = 'statistic'.icon.svg;
  static String sync = 'sync'.icon.svg;
  static String config = 'config'.icon.svg;
  static String about = 'about'.icon.svg;
  static String notification = 'notification'.icon.svg;
  static String cameraTask = 'camera_task'.icon.svg;
  static String camera = 'camera'.icon.svg;
  static String history = 'history'.icon.svg;
  static String scan = 'scan'.icon.svg;
  static String close = 'close'.icon.svg;
  static String closeRegular = 'close_regular'.icon.svg;
  static String clock = 'clock'.icon.svg;
  static String calendar = 'calendar'.icon.svg;
  static String lock = 'lock'.icon.svg;
  static String lockOrange = 'lock_orange'.icon.svg;
  static String trash = 'trash'.icon.svg;
  static String cameraOrange = 'camera_orange'.icon.svg;
  static String fingerprint = 'fingerprint'.icon.svg;
  static String search = 'search'.icon.svg;
  static String search1 = 'search1'.icon.svg;
  static String barcode = 'barcode'.icon.svg;
  static String hamburger = 'hamburger'.icon.svg;
  static String help = 'help'.icon.svg;
  static String add = 'add'.icon.svg;
  static String remove = 'remove'.icon.svg;
  static String error = 'error'.icon.svg;
  static String edit = 'edit'.icon.svg;
  static String requiredSync = 'required_sync'.icon.svg;
  static String requiredAttendance = 'required_attendance'.icon.svg;
  static String requiredInternet = 'required_internet'.icon.svg;
  static String requiredTask = 'required_task'.icon.svg;
  static String requiredDownload = 'required_download'.icon.svg;
  static String success = 'success'.icon.svg;
  static String failure = 'failure'.icon.svg;
  static String logout = 'logout'.icon.svg;
  static String upload = 'upload'.icon.svg;
  static String shop = 'shop'.icon.svg;
  static String bin = 'bin'.icon.svg;
  static String binCircle = 'bin_circle'.icon.svg;
  static String requestSignout = 'request_signout'.icon.svg;
  static String requestSkip = 'request_skip'.icon.svg;
  static String requestClose = 'request_close'.icon.svg;
  static String backStepArrow = 'back_step_arrow'.icon.svg;
  static String orderSuccess = 'order_success'.icon.svg;
  static String attendanceReport = 'attendance_report'.icon.svg;
  static String noInternet = 'no_internet'.icon.svg;
  static String closeToast = 'close_toast'.icon.svg;
}
