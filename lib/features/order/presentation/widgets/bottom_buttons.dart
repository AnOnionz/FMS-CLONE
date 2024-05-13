import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/button/flat.dart';

class BottomButtons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback? onNext;
  const BottomButtons({super.key, required this.onBack, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              onBack();
            },
            child: Container(
                height: 56.h,
                width: 56.h,
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.all(14.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gainsboro)),
                child: SvgPicture.asset(
                  AppIcons.backStepArrow,
                )),
          ),
          Expanded(
            child: FlatButton(
              onPressed: onNext != null
                  ? () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onNext!.call();
                    }
                  : null,
              name: 'Tiếp tục',
              color: AppColors.orange,
              disableTextColor: AppColors.delRio,
              disableColor: AppColors.potPourri,
            ),
          ),
        ],
      ),
    );
  }
}
