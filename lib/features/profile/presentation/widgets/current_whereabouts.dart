import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'dropdown_field.dart';

class CurrentWhereaboutsState extends StatefulWidget {
  const CurrentWhereaboutsState({super.key});

  @override
  State<CurrentWhereaboutsState> createState() =>
      _CurrentWhereaboutsStateState();
}

class _CurrentWhereaboutsStateState extends State<CurrentWhereaboutsState> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DropdownField(
        hint: 'Tỉnh/Thành',
        values: [1, 2, 3],
      ).bottom18,
      DropdownField(
        hint: 'Quận/huyện',
        values: [1, 2, 3],
      ).bottom18,
      DropdownField(
        hint: 'Phường/Xã',
        values: [1, 2, 3],
      ).bottom18,
      AppTextFormField(
        label: 'Số nhà, tên đường,...',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ),
    ]);
  }
}
