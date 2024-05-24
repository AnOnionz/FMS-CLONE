import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';

import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/icons.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;
  final VoidCallback? onBack;
  final Widget? iconBack;
  const DefaultAppBar(
      {Key? key, required this.title, this.action, this.onBack, this.iconBack});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(context.screenWidth, 40.h),
        child: AppBar(
          titleSpacing: 0.0,
          forceMaterialTransparency: true,
          leadingWidth: 42.w,
          leading: GestureDetector(
            onTap: onBack ??
                () {
                  try {
                    context.popIfCan();
                  } catch (e) {
                    context.popIfCan();
                  }
                },
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: iconBack ?? SvgPicture.asset(AppIcons.back),
            ),
          ),
          title: Text(
            title,
            style: context.textTheme.h2,
          ),
          actions: [action ?? SizedBox()],
          automaticallyImplyLeading: false,
          centerTitle: true,
        ));
  }

  @override
  Size get preferredSize => Size(0, 48.h);
}

class HistoryButton extends StatelessWidget {
  final VoidCallback onPressed;
  const HistoryButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: GestureDetector(
          onTap: onPressed, child: SvgPicture.asset(AppIcons.history)),
    );
  }
}

class SearchButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SearchButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: GestureDetector(
          onTap: onPressed, child: SvgPicture.asset(AppIcons.search)),
    );
  }
}
