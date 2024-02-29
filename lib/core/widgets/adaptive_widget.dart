import 'package:flutter/material.dart';

class AdaptiveWidget extends StatelessWidget {
  final Widget child;
  final Widget? other;
  final bool Function()? whenOther;
  const AdaptiveWidget(
      {super.key, required this.child, this.other, this.whenOther})
      : assert((whenOther != null && other != null) || whenOther == null);

  @override
  Widget build(BuildContext context) {
    if (whenOther?.call() == true) {
      return other!;
    }
    return child;
  }
}
