import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'dropdown_field.dart';

class DesiredJobPosition extends StatefulWidget {
  const DesiredJobPosition({super.key});

  @override
  State<DesiredJobPosition> createState() => _DesiredJobPositionState();
}

class _DesiredJobPositionState extends State<DesiredJobPosition> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DropdownField(
        hint: 'Vị trí',
        values: ['PG/PB', 'Helper', 'SUP'],
        width: 100.wPerc - 80.w,
      ).bottom18,
      AppTextFormField(
        label: 'Địa bàn làm việc mong muốn',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      DropdownField(
        hint: 'Nguồn tuyển dụng',
        values: [
          'Facebook',
          'Linkedin',
          'Zalo',
          'Top CV',
          'Vietnamwork',
          'Được giới thiệu',
          'Khác'
        ],
        width: 100.wPerc - 80.w,
      ),
    ]);
  }
}
