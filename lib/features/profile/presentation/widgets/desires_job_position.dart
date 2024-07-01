import 'package:flutter/cupertino.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'dropdown_field.dart';

class DesiredJobPosition extends StatefulWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const DesiredJobPosition({super.key, required this.onChanged});

  @override
  State<DesiredJobPosition> createState() => _DesiredJobPositionState();
}

class _DesiredJobPositionState extends State<DesiredJobPosition> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DropdownField<DesiredPosition>(
        hint: 'Vị trí',
        label: (option) => option.value,
        values: [
          DesiredPosition.PB,
          DesiredPosition.PG,
          DesiredPosition.HELPER,
          DesiredPosition.SUP
        ],
        onSelected: (value) {
          setState(() {});
        },
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
      DropdownField<RecruitmentSource>(
        hint: 'Nguồn tuyển dụng',
        label: (option) => option.value,
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
          setState(() {});
        },
        width: 100.wPerc - 80.w,
      ),
    ]);
  }
}
