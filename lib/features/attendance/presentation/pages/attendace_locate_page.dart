import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/attendance/attendance_core_module.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/home/home_module.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/button/outline.dart';
import '../bloc/locate_cubit.dart';

class AttendanceLocatePage extends StatefulWidget {
  final GeneralItemData entity;
  const AttendanceLocatePage({super.key, required this.entity});

  @override
  State<AttendanceLocatePage> createState() => _AttendanceLocatePageState();
}

class _AttendanceLocatePageState extends State<AttendanceLocatePage> {
  final _cubit = Modular.get<LocateCubit>();

  bool canBack = true;

  @override
  void initState() {
    _cubit.getLocation();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
            title: 'Chấm công',
            onBack: () {
              if (mounted) {
                try {
                  context.popUntil(HomeModule.route);
                } catch (e) {
                  context.popUntil(HomeModule.route);
                }
              }
            }),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                Container(
                  height: 400.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          AppImages.locationBackground,
                          height: 300.h,
                          width: 300.h,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AppImages.locationLoad,
                          height: 300.h,
                        ),
                      ),
                      Align(
                          child: Padding(
                        padding: EdgeInsets.only(top: 166.h),
                        child: BlocConsumer<LocateCubit, LocateState>(
                          bloc: _cubit,
                          listener: (context, state) {
                            if (state is LocateSuccess) {
                              setState(() {
                                canBack = false;
                              });
                              context.nextReplacementRoute(
                                  AttendanceCoreModule.attendance,
                                  arguments: widget.entity);
                            }
                          },
                          builder: (context, state) {
                            if (state is LocateInProgress) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Đanh xác định vị trí của bạn',
                                    style: context.textTheme.subtitle1
                                        ?.copyWith(color: AppColors.nightRider),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  AppIndicator()
                                ],
                              );
                            }
                            if (state is LocateDistanceInvalid) {
                              return Text(
                                'Vị trí của bạn nằm ngoài phạm vi 30m',
                                style: context.textTheme.subtitle1
                                    ?.copyWith(color: AppColors.orange),
                              );
                            }
                            if (state is LocateFailue) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Không định vị được vị trí của bạn',
                                    style: context.textTheme.subtitle1
                                        ?.copyWith(color: AppColors.nightRider),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Vui lòng kiểm tra GPS / kết nối mạng của bạn',
                                    style: context.textTheme.caption1
                                        ?.copyWith(color: AppColors.nightRider),
                                  )
                                ],
                              );
                            }
                            return SizedBox();
                          },
                        ),
                      ))
                    ],
                  ),
                ),
                Spacer(),
                BlocBuilder<LocateCubit, LocateState>(
                    bloc: _cubit,
                    builder: (context, state) {
                      if (state is LocateDistanceInvalid) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  canBack = false;
                                });
                                context.nextReplacementRoute(
                                    AttendanceCoreModule.attendance,
                                    arguments: widget.entity);
                              },
                              name: 'Tiếp tục',
                              color: AppColors.orange),
                        );
                      }
                      return SizedBox();
                    }),
                BlocBuilder<LocateCubit, LocateState>(
                    bloc: _cubit,
                    builder: (context, state) {
                      if (state is LocateFailue ||
                          state is LocateDistanceInvalid) {
                        return OutlineButton(
                            onPressed: () => _cubit.getLocation(),
                            name: 'Thử lại',
                            color: AppColors.orange);
                      }
                      return SizedBox();
                    }),
              ],
            ),
          ),
        ));
  }
}
