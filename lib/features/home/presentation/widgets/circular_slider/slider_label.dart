import 'package:flutter/material.dart';
import 'appearance.dart';

class SliderLabel extends StatelessWidget {
  final double value;
  final CircularSliderAppearance appearance;
  const SliderLabel({Key? key, required this.value, required this.appearance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: builtInfo(appearance),
    );
  }

  List<Widget> builtInfo(CircularSliderAppearance appearance) {
    final widgets = <Widget>[];
    widgets.add(appearance.infoTopLabel);

    widgets.add(appearance.infoBottomLabel);
    return widgets;
  }
}
