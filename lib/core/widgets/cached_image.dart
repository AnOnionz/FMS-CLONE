import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/mixins/common.dart';
import '/core/widgets/adaptive_indicator.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Widget Function(BuildContext, String)? placeholder;
  final bool useOldImageOnUrlChange;
  final bool useFade;
  final BoxFit? fit;

  const CachedImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.color,
    this.colorBlendMode,
    this.placeholder,
    this.useFade = true,
    this.useOldImageOnUrlChange = false,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      placeholder:
          placeholder ?? (context, url) => AdaptiveIndicator(radius: Fx.dp16),
      useOldImageOnUrlChange: useOldImageOnUrlChange,
      fadeOutDuration:
          useFade ? const Duration(milliseconds: 500) : Duration.zero,
      fadeInDuration:
          useFade ? const Duration(milliseconds: 500) : Duration.zero,
      fadeInCurve: Curves.easeOut,
      fadeOutCurve: Curves.easeIn,
      fit: fit,
    );
  }
}
