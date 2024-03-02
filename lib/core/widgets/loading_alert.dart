import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.squared),
      ),
      elevation: 0.0,
      backgroundColor: Colors.black38,
      child: const SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoActivityIndicator(),
            SizedBox(height: 8),
            Text(
              'Waiting...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
