import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double kDefaultIndicateRadius = 10.0;

class AdaptiveIndicator extends StatelessWidget {
  final double radius;
  final Color? color;
  const AdaptiveIndicator(
      {super.key, this.radius = kDefaultIndicateRadius, this.color});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: color,
        radius: radius,
      );
    }
    return SizedBox(
      height: (radius + 4) * 2,
      width: (radius + 4) * 2,
      child: CircularProgressIndicator(
        backgroundColor: color,
      ),
    );
  }
}
