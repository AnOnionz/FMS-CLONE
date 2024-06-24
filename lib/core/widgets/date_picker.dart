import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';

class DatePicker extends StatefulWidget {
  final InputDecoration? decoration;
  final DateTime? firstDate;
  final DateTime? lastDate;
  DatePicker({super.key, this.decoration, this.firstDate, this.lastDate});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController controller = TextEditingController();

  Future<void> selectDay(BuildContext context) async {
    final selectedDay = await showDatePicker(
        context: context,
        currentDate: widget.lastDate,
        firstDate: widget.firstDate ?? DateTime.parse('2000-01-01'),
        lastDate: widget.lastDate ?? DateTime.parse('2100-01-31'));

    if (selectedDay != null) {
      setState(() {
        controller.text = kdMy.format(selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => selectDay(context),
      style: context.textTheme.body1,
      decoration: widget.decoration,
    );
  }
}
