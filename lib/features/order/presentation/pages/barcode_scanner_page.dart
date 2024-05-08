import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';

class BarcodeScanner extends StatelessWidget {
  const BarcodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      bottomBar: SizedBox.shrink(),
      placeholderBuilder: (p0, p1) => Container(
        width: 100,
        height: 100,
        color: AppColors.orange,
      ),
      onScan: (String value) {
        context.pop(value);
      },
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
    );
  }
}
