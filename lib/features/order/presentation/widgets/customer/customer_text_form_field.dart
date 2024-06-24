import 'package:flutter/material.dart';
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

  const AppTextFormField(
      {super.key,
      required this.textInputAction,
      this.textInputType = TextInputType.text,
      required this.isRequired,
      required this.label,
      required this.onChanged,
      this.validate,
      this.value});

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  ValueNotifier<bool> isError = ValueNotifier(false);
  late final TextEditingController _controller =
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

  void _onTextFieldFocused() {
    setState(() {});
  }

  void setIsError(bool value) {
    isError.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.w,
      child: TextFormField(
        controller: _controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        focusNode: _focusNode,
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
            hintStyle:
                context.textTheme.body1?.copyWith(color: AppColors.nobel),
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
                borderSide:
                    BorderSide(color: AppColors.summerSky, width: 2.h))),
      ),
    );
  }
}
