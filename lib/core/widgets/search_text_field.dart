import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../styles/theme.dart';

class SearchTextField<T> extends StatefulWidget {
  final String label;
  final FutureOr<List<T>?> Function(String search) suggestionsCallback;
  final TextEditingController? controller;
  final Widget Function(
    BuildContext context,
    T value,
  ) itemBuilder;
  final void Function(T value) onSelected;
  SearchTextField(
      {super.key,
      required this.suggestionsCallback,
      required this.itemBuilder,
      required this.onSelected,
      required this.label,
      this.controller});

  @override
  State<SearchTextField<T>> createState() => _SearchTextFieldState<T>();
}

class _SearchTextFieldState<T> extends State<SearchTextField<T>> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();

  final SuggestionsController<T> _suggestionsController =
      SuggestionsController();

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      controller: _controller,
      suggestionsController: _suggestionsController,
      suggestionsCallback: widget.suggestionsCallback,
      hideOnEmpty: true,
      listBuilder: (context, children) => CustomScrollView(
        shrinkWrap: true,
        physics: kPhysics,
        slivers: [
          SliverList.builder(
            itemCount: children.length,
            itemBuilder: (context, index) => children[index],
          )
        ],
      ),
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          cursorHeight: 19.2.sp,
          cursorWidth: 0.9,
          textAlignVertical: TextAlignVertical.center,
          style: context.textTheme.body1,
          maxLength: 255,
          buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              null,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              hintText: widget.label,
              hintStyle: context.textTheme.body1,
              isCollapsed: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
              suffixIconConstraints: BoxConstraints(),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: SvgPicture.asset(
                  AppIcons.search1,
                  colorFilter:
                      ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.sqr),
                  borderSide: BorderSide(color: '#EA9567'.toColor())),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.sqr),
                  borderSide: BorderSide(color: '#EA9567'.toColor()))),
        );
      },
      hideKeyboardOnDrag: true,
      itemBuilder: widget.itemBuilder,
      onSelected: (value) {
        widget.onSelected(value);
        setState(() {
          _controller.clear();
          _suggestionsController.close();
        });
      },
    );
  }
}
