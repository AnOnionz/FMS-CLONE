import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';

class DataLoadErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const DataLoadErrorWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tải dữ liệu thất bại',
          style: context.textTheme.subtitle1,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 120,
          child: FlatButton(
              onPressed: onPressed, name: 'Thử lại', color: AppColors.orange),
        )
      ],
    );
  }
}
