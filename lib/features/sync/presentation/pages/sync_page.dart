import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/button/flat.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({super.key});

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Đồng bộ dữ liệu'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(16.w, 27.h, 16.w, 0),
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _syncStatus(false),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 32.h),
                      child: CustomScrollView(
                          shrinkWrap: true,
                          physics: RangeMaintainingScrollPhysics(
                              parent: ClampingScrollPhysics()),
                          slivers: [
                            SliverList.separated(
                              itemCount: 8,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.h),
                              itemBuilder: (context, index) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Container(
                                      height: 5.h,
                                      width: 5.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.black),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Ghi chú cuối ca',
                                    style: context.textTheme.caption2,
                                  )),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: '24',
                                    style: context.textTheme.caption1
                                        ?.copyWith(color: '414D55'.toColor()),
                                    children: [
                                  TextSpan(
                                    text: ' data',
                                    style: context.textTheme.caption2,
                                  )
                                ])),
                            Text('65%')
                          ],
                        ),
                        SizedBox(height: 8.h),
                        ProgressBar(
                          value: 1,
                          width: context.screenWidth,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.orange,
                              AppColors.orange.withOpacity(0.8)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.squared)),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 25,
                  color: AppColors.black.withOpacity(0.15))
            ]),
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
            child: FlatButton(
              onPressed: () {},
              name: 'Đồng bộ',
              color: AppColors.orange,
              disableColor: AppColors.potPourri,
              disableTextColor: AppColors.delRio,
            ),
          )
        ],
      ),
    );
  }

  Widget _syncStatus(bool isSynchronized) {
    if (isSynchronized) {
      return Column(
        children: [
          SvgPicture.asset(
            AppIcons.upload,
            colorFilter: ColorFilter.mode(AppColors.nobel, BlendMode.srcIn),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Text(
              'Tất cả dữ liệu đã được đồng bộ',
              style: context.textTheme.h3,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        SvgPicture.asset(AppIcons.upload),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Text(
            'Yêu cầu đồng bộ dữ liệu',
            style: context.textTheme.h3?.copyWith(color: AppColors.orange),
          ),
        ),
      ],
    );
  }
}
