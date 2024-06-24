import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'dropdown_field.dart';
import 'profile_box.dart';

class PermanentResidence extends StatefulWidget {
  const PermanentResidence({super.key});

  @override
  State<PermanentResidence> createState() => _PermanentResidenceState();
}

class _PermanentResidenceState extends State<PermanentResidence> {
  @override
  Widget build(BuildContext context) {
    return ProfileBox(
        child: Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child:
              Text('Địa chỉ trên hộ khẩu', style: context.textTheme.subtitle1),
        ),
      ),
      DropdownField(
        hint: 'Tỉnh/Thành',
        values: [1, 2, 3],
      ).bottom12,
      DropdownField(
        hint: 'Quận/huyện',
        values: [1, 2, 3],
      ).bottom12,
      DropdownField(
        hint: 'Phường/Xã',
        values: [1, 2, 3],
      ).bottom12,
      AppTextFormField(
        label: 'Số nhà, tên đường,...',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom12,
    ]));
  }
}
