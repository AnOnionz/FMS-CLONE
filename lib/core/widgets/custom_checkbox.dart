import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    this.onChanged,
    required this.value,
  }) : super(key: key);
  final bool value;
  final Function(bool)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged?.call(!widget.value);
      },
      child: Container(
        width: 24.h,
        height: 24.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.nobel,
          ),
        ),
        child: widget.value
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 16.h,
                  color: AppColors.nobel,
                ),
              )
            : null,
      ),
    );
  }
}
