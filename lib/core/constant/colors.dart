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

  static const Color yellow = Color(0xFFE000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
}
