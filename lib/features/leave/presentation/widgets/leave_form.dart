import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/leave.dart';

class LeaveForm extends StatefulWidget {
  final DateTime date;
  final Leave model;
  LeaveForm({super.key, required this.model, required this.date});

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController reasonController = TextEditingController();

  late final TextEditingController startController = TextEditingController(
      text: DateFormat('HH:mm').format(widget.model.project.start));
  late final TextEditingController endController = TextEditingController(
      text: DateFormat('HH:mm').format(widget.model.project.end));

  final _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.squared),
      borderSide: BorderSide(color: AppColors.gainsboro));

  bool inValidTime(DateTime start, DateTime end) {
    return start.isAfter(end);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          projectName(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: reason(),
          ),
          date(),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                    child: timeOf(
                  startController,
                  widget.model.project.start,
                  enabled: true,
                  validate: () => inValidTime(
                      widget.model.project.start, widget.model.project.end),
                  onDayChanged: (time) => setState(() {
                    widget.model.project.start = widget.model.project.start
                        .copyWith(hour: time.hour, minute: time.minute);
                    startController.text =
                        DateFormat('HH:mm').format(widget.model.project.start);
                  }),
                )),
                SizedBox(
                  width: 22.w,
                ),
                Expanded(
                    child: timeOf(
                        endController,
                        enabled: true,
                        widget.model.project.end,
                        validate: () => inValidTime(widget.model.project.start,
                            widget.model.project.end),
                        onDayChanged: (time) => setState(() {
                              widget.model.project.end =
                                  widget.model.project.end.copyWith(
                                      hour: time.hour, minute: time.minute);
                              endController.text = DateFormat('HH:mm')
                                  .format(widget.model.project.end);
                            })))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget projectName() {
    return TextField(
      controller:
          TextEditingController(text: 'Dự án ${widget.model.project.name}'),
      enabled: false,
      style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.h),
          fillColor: AppColors.aliceBlue,
          filled: true,
          disabledBorder: _border),
    );
  }

  Widget reason() {
    return TextField(
      controller: reasonController,
      style: context.textTheme.body1,
      maxLines: 4,
      cursorHeight: 19.2.sp,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: 'Lý do',
          hintStyle: context.textTheme.body1,
          contentPadding: EdgeInsets.all(16.h),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.squared),
              borderSide: BorderSide(color: AppColors.gainsboro)),
          enabledBorder: _border),
    );
  }

  Widget date() {
    return TextField(
      controller: TextEditingController(
          text: DateFormat('dd/MM/yyyy').format(widget.date)),
      enabled: false,
      style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.h),
          fillColor: AppColors.aliceBlue,
          suffixIconConstraints: BoxConstraints(),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              AppIcons.calendar,
              height: 18.h,
            ),
          ),
          filled: true,
          disabledBorder: _border),
    );
  }

  Widget timeOf(TextEditingController controller, DateTime time,
      {bool enabled = false,
      Function(TimeOfDay time)? onDayChanged,
      bool Function()? validate}) {
    return TextFormField(
        controller: controller,
        enabled: enabled,
        readOnly: true,
        validator: (value) {
          if (validate?.call() ?? false) {
            return 'Thời gian không hợp lệ';
          }
          return null;
        },
        onTap: () async {
          if (enabled) {
            final timeChanged = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: time.hour, minute: time.minute),
              builder: (BuildContext context, Widget? child) {
                return TimePickerTheme(
                  data: TimePickerTheme.of(context)
                      .copyWith(backgroundColor: AppColors.aliceBlue),
                  child: MediaQuery(
                    data: context.mq.copyWith(alwaysUse24HourFormat: true),
                    child: child!,
                  ),
                );
              },
            );
            if (timeChanged != null) {
              onDayChanged?.call(timeChanged);
            }
            _formKey.currentState!.validate();
          }
        },
        contextMenuBuilder: (context, editableTextState) => SizedBox(),
        style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.h),
            fillColor: AppColors.aliceBlue,
            suffixIconConstraints: BoxConstraints(),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                AppIcons.clock,
                height: 18.h,
              ),
            ),
            helperText: '',
            filled: !enabled,
            focusedBorder: _border,
            enabledBorder: _border,
            disabledBorder: _border,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.squared),
                borderSide: BorderSide(color: AppColors.brickRed)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.squared),
                borderSide: BorderSide(color: AppColors.brickRed))));
  }
}
