import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/home/presentation/widgets/common_info.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.aliceBlue,
      appBar: PreferredSize(
          preferredSize: Size(context.screenWidth, 35.h),
          child: Padding(
            padding: Fx.pH16,
            child: AppBar(
              leading: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DA01-0909090909-MA001-0.1.1-10.10-ios',
                  style: context.textTheme.caption3,
                ),
              ),
              forceMaterialTransparency: true,
              leadingWidth: context.screenWidth - 40.w,
              actions: [SvgPicture.asset(AppIcons.circleUser)],
            ),
          )),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Column(
          children: [
            Text(
              'Thông tin chung',
              style: context.textTheme.h2,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
                child: CommonInfo())
          ],
        ),
      ),
    );
  }
}
