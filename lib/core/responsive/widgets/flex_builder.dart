import 'package:flutter/widgets.dart';

import '../utilities/flex_manager.dart';

/// [FlexibleBuilder] is a widget that provides a design size to its child and
/// enables the possibility to use the size extensions.
/// [designSize] is the size that you designed your app for, like 375x812.
/// You can take this size from your design tool.
class FlexibleBuilder extends StatefulWidget {
  /// [FlexibleBuilder] is a widget that provides a design size to its child and
  /// enables the possibility to use the size extensions.
  /// [designSize] is the size that you designed your app for, like 375x812.
  /// You can take this size from your design tool.
  const FlexibleBuilder({
    required this.designSize,
    required this.child,
    super.key,
  });

  /// [designSize] is the size that you designed your app for, like 375x812.
  final Size designSize;

  /// [child] is the widget that you want to provide the design size to.
  final Widget child;

  @override
  State<FlexibleBuilder> createState() => _FlexibleBuilderState();
}

class _FlexibleBuilderState extends State<FlexibleBuilder>
    with WidgetsBindingObserver {
  late final FlexManager _flowManager;

  @override
  void initState() {
    super.initState();
    _flowManager = FlexManager(
      designSize: widget.designSize,
      context: context,
    );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didUpdateWidget(FlexibleBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    _flowManager.updateContext(context);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _rebuildChildren(context);
      _flowManager.updateContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _rebuildChildren(BuildContext context) {
    void rebuild(Element el) {
      el
        ..markNeedsBuild()
        ..visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
