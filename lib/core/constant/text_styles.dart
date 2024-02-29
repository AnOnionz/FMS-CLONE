import 'package:base/core/constant/fonts.dart';
import 'package:flutter/material.dart';

@immutable
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle? h1;
  final TextStyle? h2;
  const AppTextTheme({
    this.h1,
    this.h2,
  });

  const AppTextTheme.fallback()
      : this(
          h1: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.mulish,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          h2: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.mulish,
            height: 8.57,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
        );

  @override
  AppTextTheme copyWith({
    TextStyle? h1,
    TextStyle? h2,
  }) {
    return AppTextTheme(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
    );
  }

  @override
  AppTextTheme lerp(AppTextTheme? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      h1: TextStyle.lerp(h1, other.h1, t),
      h2: TextStyle.lerp(h2, other.h2, t),
    );
  }
}
