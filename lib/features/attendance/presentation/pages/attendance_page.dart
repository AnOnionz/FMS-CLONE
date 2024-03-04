import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/button/flat.dart';

import '../../../../core/services/map/google_map_service.dart';
import '../widgets/time_box.dart';

class TimekeepingPage extends StatelessWidget {
  const TimekeepingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double appbarHeight = 12.h + 26.4.sp + context.screenPadding.top;
    final double bottomPadding = 24.h;
    final double buttonHeight = 56.h;
    final double space = 32.h;
    final double cameraHeight = 58.h + 32.h + 14.h + 19.2.sp;
    final double infoHeight = 32.h + 24.h + 6.h + 19.2.sp * 4;
    final placeHolder = appbarHeight +
        bottomPadding +
        buttonHeight +
        space +
        cameraHeight +
        infoHeight;
    final GoogleMapService _mapService = GoogleMapService();
    _mapService.padding = EdgeInsets.only(
        bottom: context.screenHeight -
            placeHolder -
            (context.screenHeight / 2 - placeHolder));
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
                                type: AttendanceType.CheckIn,
                                time: DateTime.now(),
                              ),
                              TimeBox(type: AttendanceType.CheckOut),
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
