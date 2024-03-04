// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';

import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/icons.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const DefaultAppBar({Key? key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(context.screenWidth, 40.h),
        child: AppBar(
          forceMaterialTransparency: true,
          leadingWidth: 40.w,
          leading: GestureDetector(
            onTap: () => Modular.to.pop(),
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: SvgPicture.asset(
                AppIcons.back,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Text(
              title,
              style: context.textTheme.h2,
            ),
          ),
          actions: actions,
          centerTitle: true,
        ));
  }

  @override
  Size get preferredSize => Size(0, 40.h);
}
