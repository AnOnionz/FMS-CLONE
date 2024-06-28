import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/location/location_service.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:fms/features/attendance/presentation/bloc/cubit/attendance_info_cubit.dart';
import 'package:fms/features/home/presentation/bloc/necessary_bloc.dart';
import 'package:fms/features/home/presentation/widgets/notifications.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/map/google_map_service.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/button/outline.dart';
import '../../../home/domain/entities/general_item_data.dart';
import '../../../home/home_module.dart';
import '../../../images/presentation/widgets/image_view.dart';
import '../widgets/time_box.dart';

class AttendancePage extends StatefulWidget {
  final GeneralFeatureData entity;
  final AttendanceType type;

  AttendancePage({super.key, required this.type, required this.entity});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final bloc = Modular.get<AttendanceBloc>();
  final cubit = Modular.get<AttendanceInfoCubit>();
  final _necessaryBloc = Modular.get<NecessaryBloc>();
  final GoogleMapService _mapService = GoogleMapService();
  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  late StreamSubscription<AttendanceInfoState> _subscriptionAttendanceInfo;
  late StreamSubscription<AttendanceState> _subscriptionAttendance;

  ImageDynamic? _imageDynamic;
  AttendanceEntity? _attendanceInfo;
  bool attendanceInfoLoaded = false;

  @override
  void initState() {
    _getInfo();
    _subscriptionAttendanceInfo = cubit.stream.listen((state) {
      attendanceInfoListen(state);
    });
    _subscriptionAttendance = bloc.stream.listen((state) {
      attendanceListen(state);
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscriptionAttendance.cancel();
    _subscriptionAttendanceInfo.cancel();
    super.dispose();
  }

  bool get isPhotoRequired =>
      widget.entity.feature.featureAttendance!.isPhotoRequired ?? false;

  bool get isLocationRequired =>
      widget.entity.feature.featureAttendance!.isLocationRequired ?? false;

  bool get isWatermarkRequired =>
      widget.entity.feature.featureAttendance!.isWatermarkRequired ?? false;

  bool get isActive =>
      attendanceInfoLoaded == true &&
      switch (isWatermarkRequired) {
        true => isWatermarking.value == false,
        false => true
      } &&
      switch (isPhotoRequired) { true => _imageDynamic != null, false => true };

  void _getInfo() {
    cubit.getInfo(feature: widget.entity.feature);
  }

  void attendanceInfoListen(state) {
    if (state is AttendanceInfoSuccess) {
      setState(() {
        _attendanceInfo = state.info;
        attendanceInfoLoaded = true;
      });
    }
    if (state is AttendanceInfoFailure) {
      showFailure(
          title: 'Tải dữ liệu thất bại',
          icon: SvgPicture.asset(AppIcons.requiredDownload),
          message: 'Kiểm tra lại đường truyền mạng và thử lại',
          btnText: 'Thử lại',
          onPressed: () {
            _getInfo();
          });
    }
  }

  void attendanceListen(state) {
    if (mounted) {
      if (state is AttendanceLoading) {
        OverlayManager.showLoading();
      }
      if (state is AttendanceFailure) {
        OverlayManager.hide();
        if (state.failure is FaceVerificationFailure) {
          showFaceNotMatch(
            onPressed: () {
              imageWidget.state.takeImage();
            },
          );
          return;
        }
        if (state.failure is SocketFailure) {
          showInternetFailure();
          return;
        }
        showFailure(
            title: 'Chấm công thất bại',
            icon: SvgPicture.asset(AppIcons.failure),
            message: state.failure.message ??
                'Phát sinh lỗi trong quá trình chấm công',
            btnText: 'Thử lại',
            onPressed: () {
              _attendance.call();
            });
      }
      if (state is AttendanceSuccess) {
        OverlayManager.hide();
        setState(() {
          _imageDynamic = null;
          _attendanceInfo = state.attendanceData;
        });
        showSuccess(title: 'Chấm công thành công');
      }
    }
  }

  void _attendance() {
    _necessaryBloc.add(NecessaryOut(
        () => bloc.add(AttendanceEvent(
            file: isPhotoRequired ? XFile(_imageDynamic!.path!) : null,
            position: isLocationRequired
                ? Modular.get<LocationService>().currentLocation
                : null,
            feature: widget.entity.feature)),
        feature: widget.entity.feature));
    ;
  }

  late final imageWidget = ImagePickerWidget(
    enable: _imageDynamic == null,
    isFaceDetector: false,
    height: 60.h,
    onChanged: (file) {
      setState(() {
        _imageDynamic = file;
      });
    },
    isWatermarkRequired: isWatermarkRequired,
    isWatermarking: isWatermarking,
  );

  // void _showSheetHistory(BuildContext context) {
  //   OverlayManager.showSheet(
  //       body: Padding(
  //     padding: EdgeInsets.only(top: 20.h),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Align(
  //           alignment: Alignment.centerLeft,
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //               left: 10.w,
  //             ),
  //             child: Text(
  //               'Lịch sử chấm công',
  //               style: context.textTheme.h2,
  //             ),
  //           ),
  //         ),
  //         Expanded(child: AttendanceHistory()),
  //       ],
  //     ),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    _mapService.padding = paddingBottom(context);

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Chấm công',
        onBack: () => context.popUntil(HomeModule.route),
        // action: HistoryButton(onPressed: () => _showSheetHistory(context))
      ),
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
                                    'Chụp hình',
                                    style: context.textTheme.subtitle1,
                                  ),
                                  SizedBox(height: 14.h),
                                  SizedBox(
                                    height: 60.h,
                                    child: ListViewImages(
                                      height: 60.h,
                                      feature: widget.entity.feature,
                                      imagePickerButton: imageWidget,
                                      onDeleted: (image) {
                                        setState(() {
                                          _imageDynamic = null;
                                        });
                                      },
                                      images: _imageDynamic != null
                                          ? [_imageDynamic!]
                                          : [],
                                    ),
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
                                child: BlocBuilder<AttendanceInfoCubit,
                                    AttendanceInfoState>(
                                  bloc: cubit,
                                  builder: (context, state) {
                                    if (state is AttendanceInfoSuccess) {
                                      return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                                text: TextSpan(
                                                    text: 'Outlet: ',
                                                    style: context
                                                        .textTheme.subtitle1
                                                        ?.copyWith(
                                                            color: AppColors
                                                                .nobel),
                                                    children: [
                                                  TextSpan(
                                                      text: widget.entity
                                                          .general.outlet.name,
                                                      style: context
                                                          .textTheme.subtitle1
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .black))
                                                ])),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 12.h),
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: 'Booth: ',
                                                      style: context
                                                          .textTheme.subtitle1
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .nobel),
                                                      children: [
                                                    TextSpan(
                                                        text: widget.entity
                                                            .general.booth.name,
                                                        style: context
                                                            .textTheme.subtitle1
                                                            ?.copyWith(
                                                                color: AppColors
                                                                    .black))
                                                  ])),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.h),
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: 'Địa chỉ: ',
                                                      style: context
                                                          .textTheme.subtitle1
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .nobel),
                                                      children: [
                                                    TextSpan(
                                                        text: widget
                                                            .entity
                                                            .general
                                                            .outlet
                                                            .address,
                                                        style: context
                                                            .textTheme.subtitle1
                                                            ?.copyWith(
                                                                color: AppColors
                                                                    .black))
                                                  ])),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                          ]);
                                    }
                                    if (state is AttendanceInfoFailure) {
                                      return Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 40.h),
                                          child: SizedBox(
                                            width: 120.w,
                                            child: Column(
                                              children: [
                                                OutlineButton(
                                                    onPressed: _getInfo,
                                                    name: 'Thử lại',
                                                    color: AppColors.orange)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 40.h),
                                        child: Column(
                                          children: [
                                            AppIndicator(),
                                            SizedBox(height: 8.h),
                                            Text('Tải dữ liệu chấm công',
                                                style:
                                                    context.textTheme.subtitle1)
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        ZoomIn(
                            duration: 300.milliseconds,
                            child: BlocBuilder<AttendanceBloc, AttendanceState>(
                              bloc: bloc,
                              builder: (context, state) {
                                return FlatButton(
                                  onPressed: isActive ? _attendance : null,
                                  name: widget.type.name.toUpperCase(),
                                  color: widget.type == AttendanceType.CheckIn
                                      ? AppColors.royalBlue
                                      : AppColors.orange,
                                  disableColor:
                                      widget.type == AttendanceType.CheckIn
                                          ? AppColors.solitude
                                          : AppColors.potPourri,
                                  disableTextColor:
                                      widget.type == AttendanceType.CheckIn
                                          ? '#C8C8C8'.toColor()
                                          : AppColors.delRio,
                                );
                              },
                            ))
                      ],
                    ),
                  );
          },
        ),
      ]),
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
