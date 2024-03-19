import 'dart:async';

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
  late StreamController<int> _progressController = StreamController.broadcast();

  int countData = 24;

  Duration delay = 1.seconds;

  @override
  void dispose() {
    super.dispose();
  }

  Stream<int> addStream() async* {
    int count = 0;
    yield count;
    while (count < countData) {
      await Future.delayed(delay);
      yield count += 1;
    }
    await Future.delayed(delay);
    yield countData;
  }

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
                            SizedBox(height: 8.h),
                            StreamBuilder<int>(
                                stream: _progressController.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Text(
                                      '0',
                                      style: context.textTheme.caption1
                                          ?.copyWith(color: AppColors.nobel),
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    final value = snapshot.data! / countData;
                                    return Text(
                                      '${(value * 100).toStringAsFixed(0)} %',
                                      style: context.textTheme.caption1
                                          ?.copyWith(color: AppColors.orange),
                                    );
                                  }

                                  return SizedBox(
                                    height: 16.8.sp,
                                  );
                                })
                          ],
                        ),
                        SizedBox(height: 8.h),
                        StreamBuilder<int>(
                            stream: _progressController.stream,
                            initialData: 0,
                            builder: (context, snapshot) {
                              double value = 1;

                              if (snapshot.hasData) {
                                value =
                                    (countData - snapshot.data!) / countData;

                                return AnimatedProgressBar(
                                  value: value,
                                  width: context.screenWidth,
                                  backgroundColor: 'E4EAF0'.toColor(),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.orange,
                                      AppColors.orange.withOpacity(0.8)
                                    ],
                                  ),
                                  duration: snapshot.data == 0
                                      ? Duration.zero
                                      : delay,
                                );
                              }

                              return AnimatedProgressBar(
                                value: 0,
                                width: context.screenWidth,
                                backgroundColor: 'E4EAF0'.toColor(),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.orange,
                                    AppColors.orange.withOpacity(0.8)
                                  ],
                                ),
                                duration: delay,
                              );
                            })
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
                  blurRadius: 25.squared,
                  color: AppColors.black.withOpacity(0.15))
            ]),
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
            child: FlatButton(
              onPressed: () async {
                setState(() {
                  _progressController = StreamController.broadcast();
                });
                await _progressController.addStream(addStream());
                _progressController.close();
              },
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
