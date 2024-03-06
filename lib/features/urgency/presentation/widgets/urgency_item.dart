import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/switch/advanced_switch.dart';
import 'stop_watch.dart';

class UrgencyItem extends StatefulWidget {
  final String name;

  const UrgencyItem({
    super.key,
    required this.name,
  });

  @override
  State<UrgencyItem> createState() => _UrgencyItemState();
}

class _UrgencyItemState extends State<UrgencyItem> {
  final ValueNotifier<bool> controller = ValueNotifier(false);

  void showSheetStart(BuildContext context) {
    OverlayManager.showSheet(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 13.h),
          child: Text('XÁC NHẬN',
              style:
                  context.textTheme.h2?.copyWith(color: AppColors.nightRider)),
        ),
        Text(
          'Xác nhận tạo báo cáo khẩn ?',
          textAlign: TextAlign.center,
          style: context.textTheme.body1?.copyWith(color: AppColors.nero),
        ),
        Text(
          'Vui lòng kết thúc khi bạn quay trở lại',
          textAlign: TextAlign.center,
          style: context.textTheme.body1?.copyWith(color: AppColors.nero),
        ),
        SizedBox(height: 32.h),
        FlatButton(
            onPressed: () {
              setState(() {
                controller.value = true;
              });
              context.pop();
            },
            text: 'Xác nhận',
            color: '#327CF9'.toColor())
      ],
    ));
  }

  void showSheetEnd(BuildContext context) {
    OverlayManager.showSheet(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 13.h),
          child: Text('KẾT THÚC',
              style:
                  context.textTheme.h2?.copyWith(color: AppColors.nightRider)),
        ),
        Text(
          'Bạn muốn kết thúc báo cáo khẩn ?',
          textAlign: TextAlign.center,
          style: context.textTheme.body1?.copyWith(color: AppColors.nero),
        ),
        SizedBox(height: 32.h),
        FlatButton(
            onPressed: () {
              setState(() {
                controller.value = false;
              });
              context.pop();
            },
            text: 'Kết thúc',
            color: AppColors.orange)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          controller.value ? showSheetEnd(context) : showSheetStart(context),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(52.squared),
            boxShadow: [
              BoxShadow(
                  color: '#8A959E'.toColor(0.25),
                  offset: Offset(10, 7),
                  blurRadius: 24)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  widget.name,
                  style: context.textTheme.subtitle1,
                ),
              ),
              AbsorbPointer(
                child: AdvancedSwitch(
                  controller: controller,
                  activeColor: AppColors.orange,
                  inactiveColor: AppColors.aliceBlue,
                  activeChild: StopWatch(
                    start: controller,
                  ),
                  height: 44.h,
                  thumb: ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (_, value, __) {
                      return Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20.squared),
                            border: Border.all(
                                color: AppColors.black.withOpacity(0.04)),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 1.5,
                                  color: AppColors.black.withOpacity(0.05)),
                              BoxShadow(
                                  offset: Offset(0, 1.5),
                                  blurRadius: 1.5,
                                  color: AppColors.black.withOpacity(0.08)),
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 11,
                                  color: AppColors.black.withOpacity(0.08))
                            ]),
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Text(
                              '${value ? "Off" : "On"}',
                              style: context.textTheme.button2
                                  ?.copyWith(color: AppColors.orange),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  borderRadius: BorderRadius.circular(26.squared),
                  width: 30.wPerc,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
