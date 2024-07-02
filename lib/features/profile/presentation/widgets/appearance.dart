import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/profile/presentation/widgets/user_profile_inheriterd.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'dropdown_field.dart';

class Appearance extends StatelessWidget {
  final Function(UserProfileEntity newValue) onChanged;

  Appearance({super.key, required this.onChanged});

  final dresSizes = [
    DressSize.XXS,
    DressSize.XS,
    DressSize.S,
    DressSize.M,
    DressSize.L,
    DressSize.XL,
    DressSize.XXL,
    DressSize.XXXL
  ];

  @override
  Widget build(BuildContext context) {
    final width = (context.screenWidth - 96.w) / 2;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Flexible(
            child: AppTextFormField(
              label: 'Chiều cao (m)',
              isRequired: false,
              onChanged: (value) {
                onChanged(UserProfileInherited.of(context)
                    .entity
                    .copyWith(bodyHeight: int.tryParse(value)));
              },
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: AppTextFormField(
              label: 'Cân nặng (kg)',
              isRequired: false,
              onChanged: (value) {
                onChanged(UserProfileInherited.of(context)
                    .entity
                    .copyWith(bodyWeight: int.tryParse(value)));
              },
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ).bottom18,
      Row(
        children: [
          Flexible(
            child: DropdownField<DressSize>(
                width: width,
                hint: 'Size áo',
                label: (option) => option.name,
                onSelected: (value) {
                  onChanged(UserProfileInherited.of(context)
                      .entity
                      .copyWith(shirtSize: value));
                },
                values: dresSizes),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: DropdownField<DressSize>(
                width: width,
                hint: 'Size quần/váy',
                label: (option) => option.name,
                onSelected: (value) {
                  onChanged(UserProfileInherited.of(context)
                      .entity
                      .copyWith(pantsSize: value));
                },
                values: dresSizes),
          ),
        ],
      ).bottom18,
      Row(
        children: [
          Flexible(
            child: DropdownField(
              width: width,
              hint: 'Size đầm',
              label: (option) => option.name,
              values: dresSizes,
              onSelected: (value) {
                onChanged(UserProfileInherited.of(context)
                    .entity
                    .copyWith(dressSize: value));
              },
            ),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: DropdownField(
                width: width,
                label: (option) => option.toString(),
                hint: 'Size giày',
                onSelected: (value) {
                  onChanged(UserProfileInherited.of(context)
                      .entity
                      .copyWith(shoeSize: value));
                },
                values: [35, 36, 37, 38, 39, 40, 41, 42, 43, 44]),
          ),
        ],
      ).bottom18,
      Text('Số đo 3 vòng:',
              style: context.textTheme.body1
                  ?.copyWith(color: AppColors.midnightExpress))
          .bottom18,
      Row(children: [
        Flexible(
          child: AppTextFormField(
            label: 'Vòng 1',
            isRequired: false,
            onChanged: (value) {
              onChanged(UserProfileInherited.of(context)
                  .entity
                  .copyWith(bodyBust: int.tryParse(value)));
            },
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(width: 16.w),
        Flexible(
          child: AppTextFormField(
            label: 'Vòng 2',
            isRequired: false,
            onChanged: (value) {
              onChanged(UserProfileInherited.of(context)
                  .entity
                  .copyWith(bodyWaist: int.tryParse(value)));
            },
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(width: 16.w),
        Flexible(
          child: AppTextFormField(
            label: 'Vòng 3',
            isRequired: false,
            onChanged: (value) {
              onChanged(UserProfileInherited.of(context)
                  .entity
                  .copyWith(bodyHips: int.tryParse(value)));
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ])
    ]);
  }
}
