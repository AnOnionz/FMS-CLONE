import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'profile_date_picker.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Flexible(
            child: ProfileDatePicker(
                lastDate: DateTime.now(),
                onChanged: (time) {},
                title: 'Từ ngày'),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: ProfileDatePicker(
                lastDate: DateTime.now(),
                onChanged: (time) {},
                title: 'Đến ngày'),
          )
        ],
      ).bottom18,
      AppTextFormField(
        label: 'Tên công ty',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Ngành nghề kinh doanh',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Chức vụ',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Lý do từ chức',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
    ]);
  }
}
