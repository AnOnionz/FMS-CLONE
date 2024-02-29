import 'package:flutter/material.dart';

import '/core/mixins/fx.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    Key? key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  })  : assert(mobile != null || tablet != null || desktop != null,
            'Must display at least 1 type of screen'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isMobile || context.mdWindowSize == WindowSize.small) {
      return mobile ?? const SizedBox();
    }
    if (context.isMobileTypeTablet) {
      return tablet ?? const SizedBox();
    }
    return desktop ?? const SizedBox();
  }
}
