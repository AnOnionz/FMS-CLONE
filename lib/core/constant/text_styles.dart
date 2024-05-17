import 'package:flutter/material.dart';

import 'package:fms/core/constant/fonts.dart';
import 'package:fms/core/responsive/responsive.dart';

@immutable
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? subtitle1;
  final TextStyle? body1;
  final TextStyle? body2;
  final TextStyle? button1;
  final TextStyle? button2;
  final TextStyle? caption1;
  final TextStyle? caption2;
  final TextStyle? caption3;
  const AppTextTheme({
    this.h1,
    this.h2,
    this.h3,
    this.subtitle1,
    this.body1,
    this.body2,
    this.button1,
    this.button2,
    this.caption1,
    this.caption2,
    this.caption3,
  });

  factory AppTextTheme.fallback() {
    return AppTextTheme(
      h1: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.lato,
        letterSpacing: 0.25.sp,
        height: 36.sp / 30.sp,
      ),
      h2: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.lato,
        letterSpacing: 0.15.sp,
        height: 26.4.sp / 22.sp,
      ),
      h3: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.lato,
        letterSpacing: 0.15.sp,
        height: 21.6.sp / 18.sp,
      ),
      subtitle1: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          fontFamily: AppFonts.lato,
          letterSpacing: 0.15.sp,
          height: 19.2.sp / 16.sp),
      body1: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          fontFamily: AppFonts.lato,
          letterSpacing: 0.15.sp,
          height: 19.2.sp / 16.sp),
      body2: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          fontFamily: AppFonts.lato,
          letterSpacing: 0.5.sp,
          height: 16.8.sp / 14.sp),
      button1: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          fontFamily: AppFonts.lato,
          letterSpacing: 1.25.sp,
          height: 19.2.sp / 16.sp),
      button2: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.lato,
          letterSpacing: 1.25.sp,
          height: 19.2.sp / 16.sp),
      caption1: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: AppFonts.lato,
          letterSpacing: 0.4.sp,
          height: 16.8.sp / 14.sp),
      caption2: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          fontFamily: AppFonts.lato,
          letterSpacing: 0.4.sp,
          height: 16.8.sp / 14.sp),
      caption3: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
          fontFamily: AppFonts.lato,
          letterSpacing: 0.4.sp,
          height: 14.4.sp / 12.sp),
    );
  }

  @override
  AppTextTheme copyWith(
      {final TextStyle? h1,
      final TextStyle? h2,
      final TextStyle? h3,
      final TextStyle? subtitle1,
      final TextStyle? body1,
      final TextStyle? body2,
      final TextStyle? button1,
      final TextStyle? button2,
      final TextStyle? caption1,
      final TextStyle? caption2,
      final TextStyle? caption3}) {
    return AppTextTheme(
        h1: h1 ?? this.h1,
        h2: h2 ?? this.h2,
        h3: h3 ?? this.h3,
        subtitle1: subtitle1 ?? this.subtitle1,
        body1: body1 ?? this.body1,
        body2: body2 ?? this.body2,
        button1: button1 ?? this.button1,
        button2: button2 ?? this.button2,
        caption1: caption1 ?? this.caption1,
        caption2: caption2 ?? this.caption2,
        caption3: caption3 ?? this.caption3);
  }

  @override
  AppTextTheme lerp(AppTextTheme? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
        h1: TextStyle.lerp(h1, other.h1, t),
        h2: TextStyle.lerp(h2, other.h2, t),
        button2: TextStyle.lerp(button2, other.button2, t));
  }

  @override
  String toString() {
    return 'AppTextTheme(h1: $h1, h2: $h2, h3: $h3, subtitle1: $subtitle1, body1: $body1, body2: $body2, button1: $button1, button2: $button2, caption1: $caption1, caption2: $caption2, caption3: $caption3)';
  }
}
