import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';

class DataLoadErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const DataLoadErrorWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Tải dữ liệu thất bại'),
          SizedBox(height: 20.h),
          FlatButton(
              onPressed: onPressed, name: 'Thử lại', color: AppColors.orange)
        ],
      ),
    );
  }
}
