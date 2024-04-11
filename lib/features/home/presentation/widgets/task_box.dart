import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class TaskBox extends StatelessWidget {
  final String name;
  final double height;
  final VoidCallback onPressed;

  const TaskBox({
    super.key,
    required this.name,
    required this.onPressed,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                height: height - 42,
                decoration: BoxDecoration(
                    color: 'FF0015'.toColor(0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.sqr),
                        topRight: Radius.circular(60.sqr),
                        bottomLeft: Radius.circular(5.sqr),
                        bottomRight: Radius.circular(5.sqr))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 50.h, bottom: 10.h, left: 10.w, right: 10.w),
                  child: Center(
                    child: Text(
                      name,
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
              top: 0,
              left: -0.5,
              child:
                  IgnorePointer(child: SvgPicture.asset(AppIcons.cameraTask)))
        ],
      ),
    );
  }
}
