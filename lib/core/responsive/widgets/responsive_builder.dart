import 'package:flutter/widgets.dart';

import '../utilities/iflow.dart';

/// [ResponsiveBuilder] is a widget that builds a [IFlow] based widget.
/// It's used to build a [IFlow] based widget based on the current type
/// of the [IFlow].
class ResponsiveBuilder<DeviceType, FlowType extends IFlow<DeviceType>>
    extends StatelessWidget {
  /// [ResponsiveBuilder] is a widget that builds a [IFlow] based widget.
  /// It's used to build a [IFlow] based widget based on the current type
  /// of the [IFlow].
  const ResponsiveBuilder({
    required this.flow,
    super.key,
  });

  /// [flow] is the [IFlow] that is used to build the widget.
  final FlowType flow;

  @override
  Widget build(BuildContext context) {
    return flow.getCurrentFlow(flow.getCurrentType());
  }
}
