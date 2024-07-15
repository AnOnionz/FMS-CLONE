import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fms/core/constant/format.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../constant/colors.dart';

class AdvancedTextField extends StatefulWidget {
  final bool enable;
  final String? value;
  final TextInputAction? textInputAction;
  final String? unit;
  final int maxLength;
  final void Function(String value)? onChanged;
  const AdvancedTextField({
    super.key,
    this.value,
    this.unit,
    this.maxLength = 10,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.enable = true,
  });

  @override
  State<AdvancedTextField> createState() => _AdvancedTextFieldState();
}

class _AdvancedTextFieldState extends State<AdvancedTextField> {
  final FocusNode _focusNode = FocusNode();

  late TextEditingController _controller = TextEditingController(
      text: widget.value != null
          ? kNumberFormater.formatString(widget.value!)
          : null);
  bool get _hasValue => widget.enable && _controller.text != '';
  bool _hasFocus = false;

  // void onChanged() {
  //   widget.onChanged?.call(_controller.value.text.replaceAll('.', ''));
  // }

  @override
  void didUpdateWidget(covariant AdvancedTextField oldWidget) {
    setState(() {
      _controller = TextEditingController(
          text: widget.value != null
              ? kNumberFormater.formatString(widget.value!)
              : null);
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    });
    super.didUpdateWidget(oldWidget);
  }

  void onFocus() {
    if (_focusNode.hasFocus) {
      setState(() {
        _hasFocus = true;
      });
    } else {
      setState(() {
        _hasFocus = false;
      });
    }
  }

  @override
  void initState() {
    _focusNode.addListener(onFocus);
    // _controller.addListener(onChanged);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(onFocus);
    // _controller.removeListener(onChanged);
    super.dispose();
  }

  final activeBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.orange, width: 0.54),
      borderRadius: BorderRadius.circular(8.sqr));
  final inActiveBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.nobel, width: 0.54),
      borderRadius: BorderRadius.circular(8.sqr));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextField(
        canRequestFocus: widget.enable,
        focusNode: _focusNode,
        controller: _controller,
        onChanged: (value) => widget.onChanged?.call(value.replaceAll('.', '')),
        inputFormatters: [kNumberFormater],
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
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.w),
            isCollapsed: true,
            fillColor: widget.enable ? null : 'F2F6FB'.toColor(),
            filled: !widget.enable,
            suffixIcon: widget.unit != null
                ? Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Text(
                      widget.unit!,
                      style: context.textTheme.body2?.copyWith(
                          color: _hasFocus || _hasValue
                              ? AppColors.orange
                              : AppColors.nobel),
                    ),
                  )
                : null,
            suffixIconConstraints: BoxConstraints(),
            enabledBorder: _hasValue ? activeBorder : inActiveBorder,
            focusedBorder: activeBorder),
      ),
    );
  }
}
