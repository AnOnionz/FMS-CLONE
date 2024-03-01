import 'package:flutter/material.dart';
import 'package:fms/core/constant/images.dart';
import '../core/constant/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(AppImages.splash),
      ),
    );
  }
}
