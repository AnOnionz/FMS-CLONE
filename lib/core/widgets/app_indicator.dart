import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:rive/rive.dart';

class AppIndicator extends StatelessWidget {
  final double? height;
  final double? width;
  const AppIndicator({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 4.hPerc,
      width: width ?? 4.hPerc,
      child: RiveAnimation.asset(
        'loading'.rive.riv,
        fit: BoxFit.contain,
      ),
    );
  }
}
