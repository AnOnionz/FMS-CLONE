import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';

class TrustworthyPerson extends StatefulWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const TrustworthyPerson({super.key, required this.onChanged});

  @override
  State<TrustworthyPerson> createState() => _TrustworthyPersonState();
}

class _TrustworthyPersonState extends State<TrustworthyPerson> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppTextFormField(
        label: 'Họ tên',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Quan hệ',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Số điện thoại',
        isRequired: false,
        onChanged: (value) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
    ]);
  }
}
