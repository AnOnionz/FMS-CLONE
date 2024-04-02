import 'package:flutter/material.dart';
import 'package:fms/core/constant/images.dart';

typedef AnimationCreatedCallback = Function(AnimationController controller);

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.logo,
      ),
    );
  }
}
