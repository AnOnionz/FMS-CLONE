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
  static const Color blackRussian = Color(0xFF1D1E20);
  static const Color white = Color(0xFFFFFFFF);
  static const Color aliceBlue = Color(0xFFF2F6FB);
  static const Color orange = Color(0xFFE65100);
  static const Color nobel = Color(0xFF9E9E9E);
  static const Color solitude = Color(0xFFE4EAFF);
  static const Color nero = Color(0xFF212121);
  static const Color dimGray = Color(0xFF616161);
  static const Color nightRider = Color(0xFF303030);
  static const Color brickRed = Color(0xFFD73542);
  static const Color alizarin = Color(0xFFDB2836);
  static const Color gainsboro = Color(0xFFE3E3E3);
  static const Color royalBlue = Color(0xFF427FDA);
  static const Color delRio = Color(0xFFBEA192);
  static const Color roseWhite = Color(0xFFF7EDE9);
  static const Color potPourri = Color(0xFFEADCD6);
  static const Color lavenderBlue = Color(0xFFCBD6FF);
  static const Color summerSky = Color(0xFF27A9E0);
  static const Color fireBrick = Color(0xFFB3261E);
  static const Color whisper = Color(0xFFEBEBEB);
  static const Color midnightExpress = Color(0xFF252837);
  static const Color silver = Color(0xFFC6C6C6);
}
