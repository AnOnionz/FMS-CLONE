import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/app_indicator.dart';

class BarcodeScanner extends StatelessWidget {
  final Function(String value) onScan;
  const BarcodeScanner({super.key, required this.onScan});

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      placeholderBuilder: (p0, p1) => Center(
        child: AppIndicator(height: 40.w, width: 40.w),
      ),
      borderColor: AppColors.orange,
      appBar: DefaultAppBar(title: 'Quét mã'),
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
