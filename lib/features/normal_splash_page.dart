import 'package:flutter/material.dart';
import '../core/constant/colors.dart';
import '../core/constant/images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
