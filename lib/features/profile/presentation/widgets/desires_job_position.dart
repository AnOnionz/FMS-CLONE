import 'package:flutter/cupertino.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'dropdown_field.dart';
import 'user_profile_inheriterd.dart';

class DesiredJobPosition extends StatelessWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const DesiredJobPosition({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DropdownField<DesiredPosition>(
        hint: 'Vị trí',
        label: (option) => option.value,
        value: UserProfileInherited.of(context).entity.desiredPosition,
        values: [
          DesiredPosition.PB,
          DesiredPosition.PG,
          DesiredPosition.HELPER,
          DesiredPosition.SUP
        ],
        onSelected: (value) {
          onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(desiredPosition: value));
        },
        width: 100.wPerc - 80.w,
      ).bottom18,
      AppTextFormField(
        label: 'Địa bàn làm việc mong muốn',
        isRequired: false,
        value: UserProfileInherited.of(context).entity.desiredLocation,
        onChanged: (value) {
          onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(desiredLocation: value));
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      DropdownField<RecruitmentSource>(
        hint: 'Nguồn tuyển dụng',
        label: (option) => option.value,
        value: UserProfileInherited.of(context).entity.recruitmentSource,
        values: [
          RecruitmentSource.FACEBOOK,
          RecruitmentSource.LINKEDIN,
          RecruitmentSource.ZALO,
          RecruitmentSource.TOP_CV,
          RecruitmentSource.VIETNAM_WORKS,
          RecruitmentSource.REFERRAL,
          RecruitmentSource.OTHER
        ],
        onSelected: (value) {
          onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(recruitmentSource: value));
        },
        width: 100.wPerc - 80.w,
      ),
    ]);
  }
}
