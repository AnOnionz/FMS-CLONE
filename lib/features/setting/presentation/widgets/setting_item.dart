import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class SettingItem extends StatelessWidget {
  final Widget? icon;
  final String? name;
  final SettingType type;
  final VoidCallback onTap;
  final bool? switchValue;
  const SettingItem(
      {super.key,
      this.icon,
      this.name,
      required this.type,
      required this.onTap,
      this.switchValue});

  @override
  Widget build(BuildContext context) {
    bool _value = switchValue ?? false;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.squared),
          boxShadow: [
            BoxShadow(
                color: '#3151CF'.toColor(0.25),
                offset: Offset(0, 0),
                blurRadius: 1)
          ]),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.squared),
        ),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: icon != null ? 12.w : 0),
              child: icon ?? SizedBox(),
            ),
            name != null
                ? Text(
                    name!,
                    overflow: TextOverflow.clip,
                    style: context.textTheme.subtitle1
                        ?.copyWith(color: AppColors.nero),
                  )
                : SizedBox()
          ],
        ),
        trailing: switch (type) {
          SettingType.toggle => StatefulBuilder(builder: (context, setState) {
              return CupertinoSwitch(
                value: _value,
                activeColor: AppColors.orange,
                onChanged: (bool? value) {
                  setState(() {
                    _value = value ?? false;
                  });
                },
              );
            }),
          SettingType.transfer => Transform.rotate(
              angle: pi,
              child: SvgPicture.asset(
                AppIcons.back,
                height: 24.h,
                colorFilter: ColorFilter.mode(AppColors.nobel, BlendMode.srcIn),
              )),
          _ => SizedBox()
        },
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 16.w),
      ),
    );
  }
}
