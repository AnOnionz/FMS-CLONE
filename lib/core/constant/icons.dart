import 'package:fms/core/constant/fonts.dart';
import 'package:flutter/material.dart';
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
}
