import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/core/widgets/search_text_field.dart';

class RedeemGiftProductPage extends StatelessWidget {
  const RedeemGiftProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(24.h, 24.h, 16.h, 24.h),
          margin: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.squared)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: SearchTextField()),
              SizedBox(width: 14.w),
              IconButton(
                  color: Colors.amber,
                  onPressed: () {},
                  icon: SvgPicture.asset(AppIcons.barcode)),
              SizedBox(width: 6.w),
              IconButton(
                  color: Colors.amber,
                  onPressed: () {},
                  icon: SvgPicture.asset(AppIcons.hamburger)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(24.h),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.squared)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sản phẩm khách đã mua',
                    style: context.textTheme.subtitle1,
                  ),
                  SvgPicture.asset(AppIcons.help)
                ],
              )
            ],
          ),
        ),
        Spacer(),
        Container(
          color: AppColors.white,
          padding: EdgeInsets.all(22.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.dimGray),
                    ),
                    Text(
                      '12,000,000 VNĐ',
                      style: context.textTheme.button1
                          ?.copyWith(color: AppColors.nero),
                    )
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              FlatButton(
                onPressed: () {},
                text: 'Tiếp tục',
                color: AppColors.orange,
                disableTextColor: AppColors.delRio,
                disableColor: AppColors.potPourri,
              )
            ],
          ),
        )
      ],
    );
  }
}
