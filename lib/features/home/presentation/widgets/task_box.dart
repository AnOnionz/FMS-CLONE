import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class TaskBox extends StatefulWidget {
  final String name;
  final VoidCallback onPressed;
  double height;
  final Function(double newValue) onHeightUpdated;
  TaskBox(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.height,
      required this.onHeightUpdated});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  GlobalKey _key = GlobalKey();
  double height = 125.h;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final box = _key.currentContext!.findRenderObject() as RenderBox;
      final Size size = Size(box.size.width, box.size.height);

      setState(() {
        if (size.height > widget.height) {
          widget.onHeightUpdated(size.height);
        }
        if (widget.height > height) {
          height = widget.height;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + 40.h,
      width: (context.screenWidth - 64.w) / 3,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: widget.onPressed,
              child: Container(
                height: height,
                key: _key,
                decoration: BoxDecoration(
                    color: 'FF0014'.toColor(0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.sqr),
                        topRight: Radius.circular(60.sqr),
                        bottomLeft: Radius.circular(5.sqr),
                        bottomRight: Radius.circular(5.sqr))),
                child: Padding(
                  padding: EdgeInsets.only(top: 60.h, bottom: 10.h),
                  child: Center(
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.center,
                      style: context.textTheme.subtitle1
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 0, left: -0.5, child: SvgPicture.asset(AppIcons.cameraTask))
        ],
      ),
    );
  }
}
