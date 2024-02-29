import 'package:flutter/material.dart';

import '../constant/text_styles.dart';
import '/core/responsive/utilities/flex_extention.dart';

enum ThemeEnum {
  light(),
  dark();

  const ThemeEnum();
  factory ThemeEnum.parse(String value) {
    switch (value) {
      case 'dark':
        return ThemeEnum.dark;
      default:
        return ThemeEnum.light;
    }
  }
}

extension ThemeEnumExtension on ThemeEnum {
  ThemeData get theme {
    return switch (this) {
      ThemeEnum.light => lightTheme,
      ThemeEnum.dark => darkTheme,
    };
  }
}

BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(10.sp));
const Duration kDialogTransitionDuration = Duration(milliseconds: 300);
const Duration kScrollTransitionDuration = Duration(milliseconds: 50);
const Size kDialogSize = Size(300, 170);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    extensions: [AppTextTheme.fallback()]);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    extensions: [AppTextTheme.fallback()]);
