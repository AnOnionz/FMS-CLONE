import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/cached_image.dart';

class AttendanceDetailItem extends StatelessWidget {
  final AttendanceEntity attendanceEntity;
  const AttendanceDetailItem({super.key, required this.attendanceEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sqr),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              color: '#3151CF'.toColor(0.25),
            )
          ]),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(attendanceEntity.user!.name ?? '',
                        style: context.textTheme.caption1
                            ?.copyWith(color: AppColors.nero)),
                    // Padding(
                    //     padding: EdgeInsets.only(top: 6.h),
                    //     child: Text('ma0001', style: context.textTheme.body2)),
                    // Padding(
                    //     padding: EdgeInsets.only(top: 6.h),
                    //     child: Text('Booth A', style: context.textTheme.body2))
                  ],
                ),
              ),
            ),
            VerticalDivider(
              color: AppColors.whisper,
              endIndent: 20.w,
              indent: 20.w,
            ),
            Expanded(
                flex: 3,
                child: AttendanceDataDetail(
                  attendanceEntity: attendanceEntity,
                ))
          ],
        ),
      ),
    );
  }
}

class AttendanceDataDetail extends StatelessWidget {
  final AttendanceEntity attendanceEntity;
  const AttendanceDataDetail({super.key, required this.attendanceEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _item(
                name: 'Vào', context: context, data: attendanceEntity.dataIn)),
        Expanded(
            child: _item(
                name: 'Ra', context: context, data: attendanceEntity.dataOut))
      ],
    );
  }

  Widget _item(
      {required String name,
      required BuildContext context,
      AttendanceData? data}) {
    return Column(
      children: [
        Text(name,
            style: context.textTheme.body1?.copyWith(color: AppColors.nobel)),
        (data != null && data.image != null)
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: GestureDetector(
                  onTap: () => OverlayManager.showAppDialog(
                    builder: (context) => SimpleDialog(
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.sqr),
                          side: BorderSide(width: 3, color: AppColors.white)),
                      contentPadding: EdgeInsets.all(4.h),
                      insetPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      children: <Widget>[
                        Stack(
                          children: [
                            Align(
                                child: CachedImage(
                                    placeholder: (p0, p1) => SizedBox(
                                          height: 300.h,
                                          width: context.screenWidth - 32.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AppIndicator(),
                                            ],
                                          ),
                                        ),
                                    errorWidget: (p0, p1, p2) => SizedBox(),
                                    imageUrl: data.image!.getImage())),
                            Positioned(
                              right: 10.h,
                              top: 10.h,
                              child: GestureDetector(
                                onTap: () => context.pop(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle),
                                  padding: EdgeInsets.all(8.h),
                                  child: SvgPicture.asset(
                                    AppIcons.close,
                                    colorFilter: ColorFilter.mode(
                                        AppColors.black, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.sqr),
                    child: SizedBox(
                      height: 80.w,
                      width: 80.w,
                      child: CachedImage(
                          fit: BoxFit.fill,
                          imageUrl:
                              data.image!.getImage(image: ImageType.thumbnail)),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Container(
                  height: 80.w,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sqr),
                      border:
                          Border.all(color: AppColors.gainsboro, width: 0.5)),
                ),
              ),
        (data != null)
            ? Text(
                khm.format(data.deviceTime!),
                style: context.textTheme.caption3
                    ?.copyWith(color: AppColors.midnightExpress),
              )
            : Text('__:__', style: context.textTheme.caption3)
      ],
    );
  }
}
