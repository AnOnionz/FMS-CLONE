import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';

class AppTextFormField extends StatefulWidget {
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String? value)? validate;
  final String label;
  final bool isRequired;
  final String? value;
  final Function(String value) onChanged;
  final AutovalidateMode? validateMode;
  final int? maxLength;
  final int? maxValue;
  final bool onlyNumber;

  const AppTextFormField(
      {super.key,
      required this.textInputAction,
      this.textInputType = TextInputType.text,
      required this.isRequired,
      required this.label,
      required this.onChanged,
      this.validate,
      this.value,
      this.validateMode,
      this.maxLength,
      this.onlyNumber = false,
      this.maxValue});

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  ValueNotifier<bool> isError = ValueNotifier(false);
  late TextEditingController _controller =
      TextEditingController(text: widget.value);
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onTextFieldFocused);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppTextFormField oldWidget) {
    setState(() {
      _controller = TextEditingController(text: widget.value);
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    });
    super.didUpdateWidget(oldWidget);
  }

  void _onTextFieldFocused() {
    setState(() {});
  }

  void setIsError(bool value) {
    isError.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      autovalidateMode:
          widget.validateMode ?? AutovalidateMode.onUserInteraction,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      focusNode: _focusNode,
      maxLength: widget.maxLength,
      inputFormatters: [
        if (widget.onlyNumber)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        if (widget.maxValue != null)
          NumericRangeFormatter(min: 0, max: widget.maxValue!),
      ],
      buildCounter: (context,
              {required currentLength,
              required isFocused,
              required maxLength}) =>
          null,
      validator: (value) {
        if (widget.isRequired) {
          if (value.isEmptyOrNull) {
            setIsError(true);
            return 'Bắt buộc nhập';
          } else {
            setIsError(false);
          }
        }
        if (widget.validate != null) {
          final error = widget.validate?.call(value);
          setIsError(error != null);
          return error;
        }
        setIsError(false);
        return null;
      },
      style: context.textTheme.body1,
      cursorHeight: 16.sp,
      cursorColor: AppColors.summerSky,
      decoration: InputDecoration(
          label: RichText(
              text: TextSpan(
                  text: widget.label,
                  style: context.textTheme.body1?.copyWith(
                      color: _focusNode.hasFocus
                          ? AppColors.summerSky
                          : AppColors.nobel),
                  children: [
                if (widget.isRequired)
                  TextSpan(
                      text: ' *',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.brickRed))
              ])),
          suffixIcon: ValueListenableBuilder(
            valueListenable: isError,
            builder: (context, value, child) => !isError.value
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: SvgPicture.asset(AppIcons.error),
                  ),
          ),
          suffixIconConstraints: BoxConstraints(),
          hintStyle: context.textTheme.body1?.copyWith(color: AppColors.nobel),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.nobel)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.summerSky, width: 2.h)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.fireBrick, width: 2.h)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sqr),
              borderSide: BorderSide(color: AppColors.summerSky, width: 2.h))),
    );
  }
}

class NumericRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  NumericRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final newValueNumber = int.tryParse(newValue.text);

    if (newValueNumber == null) {
      return oldValue;
    }

    if (newValueNumber < min) {
      final value = max.toString();
      return newValue.copyWith(
          text: value,
          selection:
              TextSelection.fromPosition(TextPosition(offset: value.length)));
    }
    if (newValueNumber > max) {
      final value = max.toString();

      return newValue.copyWith(
          text: value,
          selection:
              TextSelection.fromPosition(TextPosition(offset: value.length)));
    }
    return newValue;
  }
}
