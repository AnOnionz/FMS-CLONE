import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';

class AdvancedTextField extends StatefulWidget {
  final TextEditingController controller;
  const AdvancedTextField({super.key, required this.controller});

  @override
  State<AdvancedTextField> createState() => _AdvancedTextFieldState();
}

class _AdvancedTextFieldState extends State<AdvancedTextField> {
  final FocusNode _focusNode = FocusNode();
  bool get _hasValue => widget.controller.text != '';
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
      borderRadius: BorderRadius.circular(8.squared));
  final inActiveBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.nobel, width: 0.54),
      borderRadius: BorderRadius.circular(8.squared));

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.numberWithOptions(),
      cursorWidth: 0.54,
      contextMenuBuilder: (context, _) => SizedBox(),
      style: context.textTheme.body2?.copyWith(color: '1B1C1F'.toColor()),
      decoration: InputDecoration(
          hintText: '0',
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Text(
              'vnđ',
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
