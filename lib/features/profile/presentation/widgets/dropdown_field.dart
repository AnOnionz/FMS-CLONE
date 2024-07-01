import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/icons.dart';

class DropdownField<T> extends StatefulWidget {
  final List<T> values;
  final String hint;
  final double? width;
  final T? value;
  final Function(T value) onSelected;
  final String Function(T option) label;
  final Widget? onError;
  const DropdownField(
      {super.key,
      required this.values,
      required this.hint,
      this.width,
      this.value,
      required this.onSelected,
      this.onError,
      required this.label});

  @override
  State<DropdownField<T>> createState() => _DropdownFieldState<T>();
}

class _DropdownFieldState<T> extends State<DropdownField<T>> {
  TextEditingController _controller = TextEditingController();

  late T? _selected = widget.value;

  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuEntry<T>> entries() {
    return widget.values.map<DropdownMenuEntry<T>>((T obj) {
      return DropdownMenuEntry<T>(
        value: obj,
        label: widget.label(obj),
        style: MenuItemButton.styleFrom(
          backgroundColor: AppColors.white,
          textStyle: context.textTheme.body1,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory),
        child: DropdownMenu<T>(
          label: Text(
            widget.hint,
            style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
          ),
          controller: _controller,
          width: widget.width ?? context.screenWidth - 80.w,
          hintText: widget.hint,
          textStyle: context.textTheme.body1,
          menuHeight: 200,
          trailingIcon: Transform.rotate(
            origin: Offset(4, -4),
            angle: pi * 1.5,
            child: SvgPicture.asset(
              AppIcons.back,
              height: 22.w,
              colorFilter: ColorFilter.mode(AppColors.nobel, BlendMode.srcIn),
            ),
          ),
          requestFocusOnTap: false,
          initialSelection: widget.value,
          onSelected: (T? value) {
            setState(() {
              _selected = value;
            });
            widget.onSelected(_selected!);
          },
          selectedTrailingIcon: Transform.rotate(
            angle: pi * 1.5,
            origin: Offset(4, -4),
            child: SvgPicture.asset(
              AppIcons.back,
              height: 22.w,
              colorFilter: ColorFilter.mode(AppColors.nobel, BlendMode.srcIn),
            ),
          ),
          menuStyle: MenuStyle(
            elevation: MaterialStatePropertyAll(2.0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sqr))),
            backgroundColor: MaterialStatePropertyAll(AppColors.white),
            shadowColor: MaterialStatePropertyAll(AppColors.white),
            surfaceTintColor: MaterialStatePropertyAll(AppColors.white),
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
          ),
          inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              constraints: BoxConstraints.tight(Size.fromHeight(56.w)),
              isCollapsed: true,
              hintStyle:
                  context.textTheme.body1?.copyWith(color: AppColors.nobel),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.sqr),
                  borderSide: BorderSide(color: AppColors.nobel)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.sqr),
                  borderSide: BorderSide(color: AppColors.nobel)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.sqr),
                  borderSide:
                      BorderSide(color: AppColors.fireBrick, width: 2.h)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.sqr),
                  borderSide:
                      BorderSide(color: AppColors.summerSky, width: 2.h))),
          dropdownMenuEntries: entries(),
        ),
      ),
    );
  }
}
