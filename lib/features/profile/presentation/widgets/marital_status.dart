import 'package:flutter/cupertino.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/profile/presentation/widgets/user_profile_inheriterd.dart';
import '../../../../core/constant/enum.dart';
import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'custom_checkbox_group.dart';

class MaritalStatus extends StatelessWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const MaritalStatus({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: CustomCheckboxGroup<Marital>(
          axis: Axis.vertical,
          label: (option) => option.value,
          group: [Marital.SINGLE, Marital.MARRIED, Marital.DIVORCED],
          onSelected: (value) {
            onChanged(UserProfileInherited.of(context)
                .entity
                .copyWith(maritalStatus: value));
          },
        ),
      ),
      AppTextFormField(
        label: 'Số con(nếu có)',
        isRequired: false,
        onChanged: (value) {
          onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(numberOfChildren: int.tryParse(value)));
        },
        textInputAction: TextInputAction.next,
      ),
    ]);
  }
}
