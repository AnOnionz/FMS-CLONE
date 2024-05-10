import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../../core/constant/colors.dart';
import '../../../domain/entities/order_entity.dart';

class CustomerTextFormField extends StatefulWidget {
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String? value)? validate;
  final String label;
  final bool isRequired;
  final CustomerInfo customerInfo;
  final Function(String value) onChanged;

  const CustomerTextFormField(
      {super.key,
      required this.textInputAction,
      this.textInputType = TextInputType.text,
      required this.isRequired,
      required this.label,
      required this.onChanged,
      this.validate,
      required this.customerInfo});

  @override
  State<CustomerTextFormField> createState() => _CustomerTextFormFieldState();
}

class _CustomerTextFormFieldState extends State<CustomerTextFormField> {
  bool isValid = true;
  late final TextEditingController _controller =
      TextEditingController(text: widget.customerInfo.value);
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(_onTextFieldFocused);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextFieldFocused() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      focusNode: _focusNode,
      validator: (value) {
        if (widget.isRequired && widget.validate != null) {
          final error = widget.validate?.call(value);
          if (error != null) {
            isValid = false;
          } else {
            isValid = true;
          }
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
          suffixIcon: isValid
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: SvgPicture.asset(AppIcons.error),
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
