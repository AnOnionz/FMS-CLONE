import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fms/core/mixins/fx.dart';

class DatePicker extends StatefulWidget {
  final InputDecoration? decoration;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? value;
  final Function(DateTime time) onSelected;
  final String? Function(String?)? validator;

  DatePicker({
    super.key,
    this.decoration,
    this.firstDate,
    this.lastDate,
    required this.onSelected,
    this.validator,
    this.value,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime? selectedDay = widget.value;
  late TextEditingController controller = TextEditingController(
      text: selectedDay != null ? kdMy.format(selectedDay!) : null);

  Future<void> selectDay(BuildContext context) async {
    selectedDay = await showDatePicker(
        context: context,
        currentDate: widget.value,
        locale: context.locale,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        fieldHintText: 'ngày/tháng/năm',
        firstDate: widget.firstDate ?? DateTime.parse('1964-01-01'),
        lastDate: widget.lastDate ?? DateTime.parse('2100-01-31'));

    if (selectedDay != null) {
      setState(() {
        controller.text = kdMy.format(selectedDay!);
      });
      widget.onSelected(selectedDay!);
    }
  }

  @override
  void didUpdateWidget(covariant DatePicker oldWidget) {
    setState(() {
      selectedDay = widget.value;
      if (selectedDay != null)
        controller = TextEditingController(text: kdMy.format(selectedDay!));
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () => selectDay(context),
      style: context.textTheme.body1,
      decoration: widget.decoration,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
