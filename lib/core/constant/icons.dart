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
}
