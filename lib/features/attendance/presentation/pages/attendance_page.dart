import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:fms/features/attendance/presentation/widgets/attendance_history.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/services/map/google_map_service.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/image_picker_widget.dart';

import '../../../home/home_module.dart';
import '../../domain/entities/feature_entity.dart';
import '../widgets/time_box.dart';

class AttendancePage extends StatefulWidget {
  final FeatureEntity entity;
  final AttendanceType type;

  const AttendancePage({super.key, required this.type, required this.entity});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final bloc = Modular.get<AttendanceBloc>();

  bool isMapLoading = true;
  final List<XFile> files = [];

  bool get isPhotoRequired =>
      widget.entity.feature.featureAttendance!.isPhotoRequired;

  void _showSheetHistory(BuildContext context) {
    OverlayManager.showSheet(
        body: Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
              ),
              child: Text(
                'Lịch sử chấm công',
                style: context.textTheme.h2,
              ),
            ),
          ),
          Expanded(child: AttendanceHistory()),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMapService _mapService = GoogleMapService();
    _mapService.padding = paddingBottom(context);

    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Chấm công',
          onBack: () => context.popUtil(HomeModule.route),
          action: HistoryButton(onPressed: () => _showSheetHistory(context))),
      body: Stack(children: [
        RepaintBoundary(child: _mapService.mapWidget),
        Padding(
          padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isPhotoRequired)
                Container(
                  width: context.screenWidth,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.sqr)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chụp ảnh checkin',
                        style: context.textTheme.subtitle1,
                      ),
                      SizedBox(height: 14.h),
                      Form(
                        child: ImagePickerWidget(
                          max: 1,
                          images: files,
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sqr)),
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
              _actionButton(widget.type, action: () {
                bloc.add(AttendanceEvent(
                    file: files.first,
                    feature: widget.entity.feature,
                    general: widget.entity.general));
              })
            ],
          ),
        )
      ]),
    );
  }

  Widget _actionButton(AttendanceType type, {VoidCallback? action}) {
    return FlatButton(
      onPressed: action,
      name: type.name.toUpperCase(),
      color: type == AttendanceType.CheckIn
          ? AppColors.royalBlue
          : AppColors.orange,
      disableColor: type == AttendanceType.CheckIn
          ? AppColors.solitude
          : AppColors.potPourri,
      disableTextColor: type == AttendanceType.CheckIn
          ? '#C8C8C8'.toColor()
          : AppColors.delRio,
    );
  }

  EdgeInsets paddingBottom(BuildContext context) {
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
    return EdgeInsets.only(
        bottom: context.screenHeight -
            placeHolder -
            (context.screenHeight / 2 - placeHolder));
  }
}
