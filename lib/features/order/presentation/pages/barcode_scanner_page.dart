import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/app_indicator.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  bool isScanned = false;
  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      canPop: false,
      placeholderBuilder: (p0, p1) => Center(
        child: AppIndicator(height: 40.w, width: 40.w),
      ),
      borderColor: AppColors.orange,
      appBar: DefaultAppBar(title: 'Quét mã'),
      bottomBar: SizedBox.shrink(),
      onScan: (String value) {
        if (context.mounted && !isScanned) {
          setState(() {
            isScanned = true;
          });
          Modular.to.pop(value);
        }
      },
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
    );
  }
}
