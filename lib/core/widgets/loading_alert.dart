import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';
import 'package:fms/core/widgets/adaptive_indicator.dart';

class LoadingAlert extends StatelessWidget {
  final String message;
  const LoadingAlert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.sqr),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AdaptiveIndicator(),
            SizedBox(height: 8),
            Text(
              message,
              style: context.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
