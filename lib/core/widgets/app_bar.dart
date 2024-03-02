// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/icons.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const DefaultAppBar({
    Key? key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(context.screenWidth, 40.h),
        child: AppBar(
          forceMaterialTransparency: true,
          leadingWidth: 40.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: GestureDetector(
              onTap: () => Modular.to.pop(),
              child: SvgPicture.asset(
                AppIcons.back,
              ),
            ),
          ),
          title: Text(
            title,
            style: context.textTheme.h2,
          ),
          centerTitle: true,
        ));
  }

  @override
  Size get preferredSize => Size(0, 40.h);
}
