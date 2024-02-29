import 'package:flutter/material.dart';

import '/core/constant/colors.dart';
import '/core/mixins/fx.dart';

class Shimmer extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final LinearGradient? gradient;
  const Shimmer(
      {super.key, required this.child, this.isLoading = true, this.gradient});

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController =
      AnimationController.unbounded(vsync: this)
        ..repeat(min: -0.5, max: 1.5, period: 1.seconds)
        ..addListener(() {
          setState(() {});
        });

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  LinearGradient get _gradient =>
      widget.gradient ??
      LinearGradient(
        colors: widget.gradient?.colors ?? AppColors.kDefaultGradient.colors,
        stops: widget.gradient?.stops ?? AppColors.kDefaultGradient.stops,
        begin: widget.gradient?.begin ?? AppColors.kDefaultGradient.begin,
        end: widget.gradient?.end ?? AppColors.kDefaultGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset offsetWithinShimmer() {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return (context.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return _gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer().dx,
            -offsetWithinShimmer().dy,
            size.width,
            size.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
