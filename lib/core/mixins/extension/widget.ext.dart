import 'package:flutter/widgets.dart';
import 'package:fms/core/responsive/responsive.dart';

extension WidgetExtension on Widget {
  Widget get bottom18 =>
      Padding(padding: EdgeInsets.only(bottom: 18.h), child: this);
}
