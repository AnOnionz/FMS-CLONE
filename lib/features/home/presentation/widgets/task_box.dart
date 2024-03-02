import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class TaskBox extends StatefulWidget {
  const TaskBox({super.key});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  GlobalKey _key = GlobalKey();
  double height = 165.h;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final box = _key.currentContext!.findRenderObject() as RenderBox;
      final Size size = Size(box.size.width, box.size.height);
      setState(() {
        print(size);
        height = size.height + 40.h;
        print(height);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: (context.screenWidth - 64.w) / 3,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              key: _key,
              decoration: BoxDecoration(
                  color: 'FF0014'.toColor(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.squared),
                      topRight: Radius.circular(60.squared),
                      bottomLeft: Radius.circular(5.squared),
                      bottomRight: Radius.circular(5.squared))),
              child: Padding(
                padding: EdgeInsets.only(top: 60.h, bottom: 30.h),
                child: Center(
                  heightFactor: 1,
                  child: Text(
                    'Chấm công Chấm công',
                    textAlign: TextAlign.center,
                    style: context.textTheme.subtitle1
                        ?.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 0, left: 0, child: SvgPicture.asset(AppIcons.cameraTask))
        ],
      ),
    );
  }
}
