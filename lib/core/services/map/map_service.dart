import 'package:flutter/widgets.dart';

abstract class MapService {
  Widget get mapWidget;
  Future<void> animateCamera(
      {required double lat,
      required double lng,
      double bearing,
      double tilt,
      double zoom});
}
