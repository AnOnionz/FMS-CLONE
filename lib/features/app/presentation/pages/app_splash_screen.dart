import 'package:flutter/material.dart';
import 'package:fms/core/constant/images.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_animations/simple_animations.dart';

typedef AnimationCreatedCallback = Function(AnimationController controller);

class AppSplashScreen extends StatelessWidget {
  final AnimationCreatedCallback? onAnimationCreated;

  const AppSplashScreen({
    super.key,
    this.onAnimationCreated,
  });

  static const iconSize = Size(97, 60);
  static const textSize = Size(142, 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final iconPosition = Offset(
            constraints.maxWidth / 2 - (iconSize.width + textSize.width) / 2,
            constraints.maxHeight / 3,
          );
          final textPosition = Offset(
            iconPosition.dx + iconSize.width,
            iconPosition.dy,
          );
          final pathSize = Size(2, iconPosition.dy + iconSize.height / 2);
          final pathPosition = Offset(
            constraints.maxWidth - iconPosition.dx - iconSize.width / 1.4,
            0,
          );

          return AppSplashAnimation(
            iconSize: iconSize,
            iconPosition: iconPosition,
            textSize: textSize,
            textPosition: textPosition,
            pathSize: pathSize,
            pathPosition: pathPosition,
            onAnimationCreated: onAnimationCreated,
          );
        },
      ),
    );
  }
}

class AppSplashAnimation extends StatefulWidget {
  final Size iconSize;
  final Size textSize;
  final Size pathSize;
  final Offset iconPosition;
  final Offset textPosition;
  final Offset pathPosition;
  final AnimationCreatedCallback? onAnimationCreated;

  const AppSplashAnimation({
    super.key,
    required this.iconSize,
    required this.textSize,
    required this.pathSize,
    required this.iconPosition,
    required this.textPosition,
    required this.pathPosition,
    this.onAnimationCreated,
  });

  @override
  State<AppSplashAnimation> createState() => _AppSplashAnimationState();
}

class _AppSplashAnimationState extends State<AppSplashAnimation>
    with AnimationMixin {
  late Animation<Movie> tween;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    final onAnimationCreated = widget.onAnimationCreated;
    if (onAnimationCreated != null) {
      onAnimationCreated(controller);
    }
  }

  void _initAnimation() {
    final movieTween = MovieTween(curve: Curves.linear)
      ..tween(
        "step1",
        Tween<double>(
          begin: widget.iconSize.width,
          end: widget.iconSize.width + widget.textSize.width,
        ),
        curve: Curves.easeInOutSine,
        duration: const Duration(milliseconds: 1000),
      )
          .thenTween(
            "step2",
            Tween<double>(begin: 0, end: widget.pathSize.height),
            curve: Curves.easeInOutSine,
            duration: const Duration(milliseconds: 1000),
          )
          .thenTween(
            "step3",
            Tween<double>(begin: 0, end: 30),
            curve: Curves.easeInOutSine,
            duration: const Duration(milliseconds: 300),
          );

    tween = movieTween.animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned(
            top: widget.textPosition.dy,
            left: widget.textPosition.dx,
            child: Image.asset(AppImages.logo),
          ),
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.isAnimating || controller.isCompleted
                  ? const SizedBox()
                  : LoadingAnimationWidget.threeRotatingDots(
                      color: Colors.white,
                      size: 40,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
