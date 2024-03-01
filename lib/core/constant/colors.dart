import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

sealed class AppColors {
  static LinearGradient kDefaultGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );

  static const Color transparent = Color(0x00000000);
  static const Color yellow = Color(0xFFE000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color aliceBlue = Color(0xFFF2F6FB);
  static const Color orange = Color(0xFFE65100);
  static const Color nobel = Color(0xFF9E9E9E);
  static const Color solitude = Color(0xFFE4EAF0);
  static const Color nero = Color(0xFF212121);
  static const Color dimGray = Color(0xFF616161);
}
