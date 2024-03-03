import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/button/flat.dart';

import '../../../../core/mixins/common.dart';
import '../../../../core/services/map/google_map_service.dart';
import '../widgets/time_box.dart';

class TimekeepingPage extends StatelessWidget {
  const TimekeepingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GoogleMapService _mapService = GoogleMapService();
    _mapService.padding = EdgeInsets.only(
        bottom: (context.screenHeight - 238.h - 19.2.sp * 5) / 2 +
            (238.h - 19.2.sp * 5));

    return Scaffold(
      appBar: DefaultAppBar(title: 'Chấm công'),
      body: Stack(children: [
        _mapService.mapWidget,
        Padding(
          padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: context.screenWidth,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.squared)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chụp ảnh checkin',
                      style: context.textTheme.subtitle1,
                    ),
                    SizedBox(height: 14.h),
                    Container(
                        padding: EdgeInsets.all(14.h),
                        decoration: BoxDecoration(
                            color: AppColors.solitude,
                            borderRadius: BorderRadius.circular(6.squared)),
                        child: SvgPicture.asset(
                          AppIcons.camera,
                          height: 30.h,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.squared)),
                  child: Padding(
                    padding: EdgeInsets.all(24.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'Outlet:',
                                  style: context.textTheme.subtitle1
                                      ?.copyWith(color: AppColors.nobel),
                                  children: [
                                TextSpan(
                                    text: 'Tên outlet',
                                    style: context.textTheme.subtitle1
                                        ?.copyWith(color: AppColors.black))
                              ])),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Địa chỉ:',
                                    style: context.textTheme.subtitle1
                                        ?.copyWith(color: AppColors.nobel),
                                    children: [
                                  TextSpan(
                                      text:
                                          '123 Trần Bình Trọng, Bình Thạnh, thHCM',
                                      style: context.textTheme.subtitle1
                                          ?.copyWith(color: AppColors.black))
                                ])),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TimeBox(
                                type: timekeepingType.checkin,
                                time: DateTime.now(),
                              ),
                              TimeBox(type: timekeepingType.checkout),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              FlatButton(
                onPressed: null,
                text: 'Chấm công vào'.toUpperCase(),
                color: AppColors.royalBlue,
                disableColor: '#E4EAFF'.toColor(),
                disableTextColor: '#C8C8C8'.toColor(),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
