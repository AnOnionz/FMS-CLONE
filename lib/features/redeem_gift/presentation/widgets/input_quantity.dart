import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class InputQuantity extends StatefulWidget {
  final int max;
  final int min;
  final VoidCallback? onMax;
  final VoidCallback? onMin;
  final EdgeInsets? padding;
  InputQuantity(
      {super.key,
      this.padding,
      required this.max,
      this.min = 0,
      this.onMax,
      this.onMin});

  @override
  State<InputQuantity> createState() => _InputQuantityState();
}

class _InputQuantityState extends State<InputQuantity> {
  int _value = 0;

  void _increase() {
    if (_value < widget.max) {
      setState(() {
        _value += 1;
      });
    } else {
      widget.onMax?.call();
    }
  }

  void _decrease() {
    if (_value > widget.min) {
      setState(() {
        _value -= 1;
      });
    } else {
      widget.onMin?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buttonQuantity(icon: AppIcons.remove, onPressed: _decrease),
        Padding(
          padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 6.w),
          child: SizedBox(
            width: 32.w,
            height: 24.h,
            child: Center(
              child: Text(
                _value.toString(),
                style: context.textTheme.body2?.copyWith(
                    color: _value > 0 ? AppColors.black : AppColors.nobel),
              ),
            ),
          ),
        ),
        _buttonQuantity(icon: AppIcons.add, onPressed: _increase),
      ],
    );
  }

  Widget _buttonQuantity({
    required String icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
            color: _value > 0 ? '#FFF2CF'.toColor() : '#F3F3F3'.toColor(),
            borderRadius: BorderRadius.circular(8.squared)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
                _value > 0 ? '#FBB217'.toColor() : '#808080'.toColor(),
                BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
