import 'package:flutter/widgets.dart';

import '../utilities/devices_flow.dart';
import 'responsive_builder.dart';

/// [Responsive] is a widget that will build a different widget
/// depending on the device size.
/// He has three parameters, [mobile], [tablet] and [desktop]
/// and depending on the device size, one of them will be built.
/// If you need a different parameter for responsive, you can use the
/// [ResponsiveBuilder] widget, creating your own flow with the [IFlow] interface.
class Responsive extends StatefulWidget {
  /// [Responsive] is a widget that will build a different widget
  /// depending on the device size.
  /// He has three parameters, [mobile], [tablet] and [desktop]
  /// and depending on the device size, one of them will be built.
  /// If you need a different parameter for responsive, you can use the
  /// [ResponsiveBuilder] widget, creating your own flow with the [IFlow] interface.
  const Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  /// [mobile] is the widget that will be built if the device is mobile.
  final Widget mobile;

  /// [tablet] is the widget that will be built if the device is tablet.
  final Widget tablet;

  /// [desktop] is the widget that will be built if the device is desktop.
  final Widget desktop;

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      flow: DeviceFlow(
        context: context,
        mobileChild: widget.mobile,
        tabletChild: widget.tablet,
        desktopChild: widget.desktop,
      ),
    );
  }
}
