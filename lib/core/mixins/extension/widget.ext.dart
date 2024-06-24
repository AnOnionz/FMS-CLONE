import 'package:flutter/widgets.dart';
import 'package:fms/core/responsive/responsive.dart';

extension WidgetExtension on Widget {
  Widget get bottom12 =>
      Padding(padding: EdgeInsets.only(bottom: 12.h), child: this);
}
