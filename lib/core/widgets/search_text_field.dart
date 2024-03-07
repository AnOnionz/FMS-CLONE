import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorHeight: 19.2.sp,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: 'Nhập mã barcode',
          hintStyle: context.textTheme.body1,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          suffixIconConstraints: BoxConstraints(),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              AppIcons.search1,
              height: 24.h,
              colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.squared),
              borderSide: BorderSide(color: '#EA9567'.toColor())),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.squared),
              borderSide: BorderSide(color: '#EA9567'.toColor()))),
    );
  }
}
