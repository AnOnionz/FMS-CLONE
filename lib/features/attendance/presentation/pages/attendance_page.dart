import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/location/location_service.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:fms/features/attendance/presentation/widgets/attendance_history.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/map/google_map_service.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../home/domain/entities/general_item_data.dart';
import '../../../home/home_module.dart';
import '../widgets/notifications.dart';
import '../widgets/time_box.dart';

class AttendancePage extends StatefulWidget {
  final GeneralItemData entity;
  final AttendanceType type;

  AttendancePage({super.key, required this.type, required this.entity});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final bloc = Modular.get<AttendanceBloc>();

  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  XFile? image;

  late AttendanceEntity? _attendanceInfo = widget.entity.general.attendance;

  final GoogleMapService _mapService = GoogleMapService();

  @override
  void initState() {
    isWatermarking.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  bool get isPhotoRequired =>
      widget.entity.feature.featureAttendance!.isPhotoRequired ?? false;

  bool get isLocationRequired =>
      widget.entity.feature.featureAttendance!.isLocationRequired ?? false;

  bool get isWatermarkRequired =>
      widget.entity.feature.featureAttendance!.isWatermarkRequired ?? false;

  bool get _validateForm {
    if (image == null) {
      return false;
    }
    if (isWatermarkRequired && isWatermarking.value == true) {
      return false;
    }
    return true;
  }

  void _attendance() {
    bloc.add(AttendanceEvent(
        file: isPhotoRequired ? image : null,
        position: isLocationRequired
            ? Modular.get<LocationService>().currentLocation
            : null,
        feature: widget.entity.feature,
        general: widget.entity.general));
  }

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
    _mapService.padding = paddingBottom(context);

    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Chấm công',
          onBack: () => context.popUtil(HomeModule.route),
          action: HistoryButton(onPressed: () => _showSheetHistory(context))),
      body: Stack(children: [
        RepaintBoundary(child: _mapService.mapWidget),
        ListenableBuilder(
          listenable: _mapService,
          builder: (context, child) {
            return _mapService.isMaploading
                ? Center(child: AppIndicator())
                : Padding(
                    padding:
                        EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (isPhotoRequired)
                          ZoomIn(
                            delay: 400.milliseconds,
                            duration: 300.milliseconds,
                            child: Container(
                              width: context.screenWidth,
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 24.w),
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
                                  ImagePickerWidget(
                                    height: 60.h,
                                    width: 60.h,
                                    enable: image == null,
                                    onChanged: (file) {
                                      setState(() {
                                        image = file;
                                      });
                                    },
                                    isWatermarkRequired: isWatermarkRequired,
                                    isWatermarking: isWatermarking,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: ZoomIn(
                            delay: 200.milliseconds,
                            duration: 300.milliseconds,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.sqr)),
                              child: Padding(
                                padding: EdgeInsets.all(24.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: 'Outlet: ',
                                              style: context.textTheme.subtitle1
                                                  ?.copyWith(
                                                      color: AppColors.nobel),
                                              children: [
                                            TextSpan(
                                                text: widget
                                                    .entity.general.outlet.name,
                                                style: context
                                                    .textTheme.subtitle1
                                                    ?.copyWith(
                                                        color: AppColors.black))
                                          ])),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        child: RichText(
                                            text: TextSpan(
                                                text: 'Địa chỉ: ',
                                                style: context
                                                    .textTheme.subtitle1
                                                    ?.copyWith(
                                                        color: AppColors.nobel),
                                                children: [
                                              TextSpan(
                                                  text: widget.entity.general
                                                      .outlet.address,
                                                  style: context
                                                      .textTheme.subtitle1
                                                      ?.copyWith(
                                                          color:
                                                              AppColors.black))
                                            ])),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TimeBox(
                                            type: AttendanceType.CheckIn,
                                            time: _attendanceInfo
                                                ?.dataIn?.deviceTime,
                                          ),
                                          TimeBox(
                                            type: AttendanceType.CheckOut,
                                            time: _attendanceInfo
                                                ?.dataOut?.deviceTime,
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        ZoomIn(
                          duration: 300.milliseconds,
                          child: _actionButton(
                              widget.type, _validateForm ? _attendance : null),
                        )
                      ],
                    ),
                  );
          },
        ),
      ]),
    );
  }

  Widget _actionButton(AttendanceType type, VoidCallback? action) {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
      bloc: bloc,
      listener: (context, state) {
        if (mounted) {
          if (state is AttendanceLoading) {
            OverlayManager.showLoading();
          }
          if (state is AttendanceFailure) {
            OverlayManager.hide();
            showFailure(context, state.failure, action);
          }
          if (state is AttendanceSuccess) {
            OverlayManager.hide();
            setState(() {
              _attendanceInfo = state.attendanceData;
            });
            showSuccess(context);
          }
        }
      },
      builder: (context, state) {
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
      },
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
