import 'package:flutter/cupertino.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'user_profile_inheriterd.dart';

class TrustworthyPerson extends StatelessWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const TrustworthyPerson({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppTextFormField(
        label: 'Họ tên',
        isRequired: false,
        onChanged: (value) {
          onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(emergencyContactName: value));
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Quan hệ',
        isRequired: false,
        onChanged: (value) {
          onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(emergencyContactRelationship: value));
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Số điện thoại',
        isRequired: false,
        onChanged: (value) {
          onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(emergencyContactPhoneNumber: value));
        },
        textInputAction: TextInputAction.next,
      ),
    ]);
  }
}
