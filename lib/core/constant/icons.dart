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
  static String clock = 'clock'.icon.svg;
  static String calendar = 'calendar'.icon.svg;
  static String lock = 'lock'.icon.svg;
  static String trash = 'trash'.icon.svg;
  static String cameraOrange = 'camera_orange'.icon.svg;
  static String fingerprint = 'fingerprint'.icon.svg;
  static String search = 'search'.icon.svg;
}
