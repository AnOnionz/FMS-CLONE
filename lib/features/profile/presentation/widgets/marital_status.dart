import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'custom_checkbox_group.dart';

class MaritalStatus extends StatefulWidget {
  const MaritalStatus({super.key});

  @override
  State<MaritalStatus> createState() => _MaritalStatusState();
}

class _MaritalStatusState extends State<MaritalStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: CustomCheckboxGroup<String>(
          axis: Axis.vertical,
          group: ['Độc thân', 'Kết hôn', 'Ly dị'],
          onSelected: (value) {},
        ),
      ),
      AppTextFormField(
        label: 'Số con(nếu có)',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ),
    ]);
  }
}
