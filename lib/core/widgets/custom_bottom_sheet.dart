import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  const CustomBottomSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Padding(
        padding: context.viewInsets,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: context.screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.sqr),
                      topRight: Radius.circular(18.sqr))),
              child: child,
            ),
            Positioned(
                top: -16.h,
                child: Container(
                  height: 16.h,
                  width: context.screenWidth - 36.w,
                  decoration: BoxDecoration(
                      color: AppColors.gainsboro,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(18.w, 16.h),
                          topRight: Radius.elliptical(18.w, 16.h))),
                )),
            Positioned(
              top: -26.h,
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: '#F2F2F2'.toColor()),
                        borderRadius: BorderRadius.circular(30.sqr)),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: GestureDetector(
                          onTap: () => context.pop(),
                          child: SvgPicture.asset(
                            AppIcons.close,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
