import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class BarcodeScanner extends StatelessWidget {
  final Function(String value) onScan;
  const BarcodeScanner({super.key, required this.onScan});

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      bottomBar: SizedBox.shrink(),
      onScan: (String value) {
        onScan(value);
      },
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
    );
  }
}
