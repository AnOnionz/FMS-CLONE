import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/home/home_module.dart';

import 'button/outline.dart';

class DataLoadErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool backToHome;
  const DataLoadErrorWidget(
      {super.key, required this.onPressed, this.backToHome = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.screenHeight / 5),
      child: Column(
        children: [
          SvgPicture.asset(AppIcons.requiredDownload),
          SizedBox(height: 40.h),
          Text(
            'Tải dữ liệu thất bại'.toUpperCase(),
            style: context.textTheme.subtitle1,
          ),
          SizedBox(height: 10.h),
          Text(
            'Kiểm tra lại đường truyền mạng và thử lại',
            style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (backToHome)
                SizedBox(
                  width: (context.screenWidth - 76.w) / 2,
                  child: OutlineButton(
                      onPressed: () => context.popUntil(HomeModule.route),
                      name: 'Trang chủ',
                      color: AppColors.orange),
                ),
              SizedBox(
                width: 16.w,
              ),
              SizedBox(
                width: (context.screenWidth - 76.w) / 2,
                child: FlatButton(
                    onPressed: onPressed,
                    name: 'Thử lại',
                    color: AppColors.orange),
              ),
            ],
          )
        ],
      ),
    );
  }
}
