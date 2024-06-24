import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

class CustomCheckboxGroup<T> extends StatefulWidget {
  final Axis axis;
  final List<T> group;
  final T? value;
  final Function(T value) onSelected;

  const CustomCheckboxGroup(
      {super.key,
      required this.group,
      required this.onSelected,
      this.value,
      this.axis = Axis.horizontal});

  @override
  State<CustomCheckboxGroup<T>> createState() => _CustomCheckboxGroupState<T>();
}

class _CustomCheckboxGroupState<T> extends State<CustomCheckboxGroup<T>> {
  late final _groupValue = widget.group;

  late T? _selectedOption = widget.value;

  void _onSelected(T? option) {
    setState(() {
      _selectedOption = option;
    });
    widget.onSelected(_selectedOption!);
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      for (final T option in _groupValue)
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: InkWell(
            onTap: () => _onSelected(option),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: _onSelected,
                  fillColor: MaterialStatePropertyAll(_selectedOption == option
                      ? AppColors.orange
                      : 'D9D9D9'.toColor()),
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(width: 8.w),
                Text(
                  option.toString(),
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.black.withOpacity(0.85)),
                )
              ],
            ),
          ),
        )
    ];
    if (widget.axis == Axis.horizontal) {
      return Wrap(
        children: options,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options,
    );
  }
}
