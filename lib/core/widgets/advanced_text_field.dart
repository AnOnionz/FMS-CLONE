import 'dart:ui';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/colors.dart';

class AdvancedTextField extends StatefulWidget {
  final String? initialValue;
  final TextInputAction? textInputAction;
  final String unit;
  final int maxLength;
  final void Function(String value)? onChanged;
  const AdvancedTextField(
      {super.key,
      this.initialValue,
      required this.unit,
      this.maxLength = 10,
      this.textInputAction = TextInputAction.next,
      this.onChanged});

  @override
  State<AdvancedTextField> createState() => _AdvancedTextFieldState();
}

class _AdvancedTextFieldState extends State<AdvancedTextField> {
  final FocusNode _focusNode = FocusNode();
  late final _formatter = CurrencyTextInputFormatter.currency(
    symbol: '',
    onChange: (p0) {
      widget.onChanged?.call(p0.replaceAll('.', ''));
    },
  );

  late final TextEditingController _controller = TextEditingController(
      text: widget.initialValue != null
          ? _formatter.formatString(widget.initialValue!)
          : null);
  bool get _hasValue => _controller.text != '';
  bool _hasFocus = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _hasFocus = true;
        });
      } else {
        setState(() {
          _hasFocus = false;
        });
      }
    });
    super.initState();
  }

  final activeBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.orange, width: 0.54),
      borderRadius: BorderRadius.circular(8.sqr));
  final inActiveBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.nobel, width: 0.54),
      borderRadius: BorderRadius.circular(8.sqr));

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      inputFormatters: [_formatter],
      keyboardType: TextInputType.numberWithOptions(),
      cursorWidth: 0.54,
      maxLength: widget.maxLength,
      cursorHeight: 16.8.sp,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      textInputAction: widget.textInputAction,
      textAlignVertical: TextAlignVertical.center,
      buildCounter: (context,
              {required currentLength,
              required isFocused,
              required maxLength}) =>
          null,
      contextMenuBuilder: (context, _) => SizedBox.shrink(),
      style: context.textTheme.body2?.copyWith(color: '1B1C1F'.toColor()),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          isCollapsed: true,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Text(
              widget.unit,
              style: context.textTheme.body2?.copyWith(
                  color: _hasFocus || _hasValue
                      ? AppColors.orange
                      : AppColors.nobel),
            ),
          ),
          suffixIconConstraints: BoxConstraints(),
          enabledBorder: _hasValue ? activeBorder : inActiveBorder,
          focusedBorder: activeBorder),
    );
  }
}
