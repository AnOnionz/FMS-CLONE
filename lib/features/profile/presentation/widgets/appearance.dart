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
  final shoeSize = [
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
  ];

  @override
  Widget build(BuildContext context) {
    final width = (context.screenWidth - 96.w) / 2;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Flexible(
            child: AppTextFormField(
              label: 'Chiều cao (cm)',
              isRequired: false,
              validate: (value) {
                if ((int.tryParse(value ?? '') ?? 0) > 255) {
                  return 'Số lượng tối đa 255';
                }
                return null;
              },
              onlyNumber: true,
              textInputType: TextInputType.numberWithOptions(),
              value: UserProfileInherited.of(context)
                  .entity
                  .bodyHeight
                  .toStringOrNull(),
              onChanged: (value) {
                onChanged(UserProfileInherited.of(context)
                    .entity
                    .copyWith(bodyHeight: int.tryParse(value) ?? 0));
              },
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: AppTextFormField(
              label: 'Cân nặng (kg)',
              validate: (value) {
                if ((int.tryParse(value ?? '') ?? 0) > 255) {
                  return 'Số lượng tối đa 255';
                }
                return null;
              },
              onlyNumber: true,
              textInputType: TextInputType.numberWithOptions(),
              isRequired: false,
              value: UserProfileInherited.of(context)
                  .entity
                  .bodyWeight
                  .toStringOrNull(),
              onChanged: (value) {
                onChanged(UserProfileInherited.of(context)
                    .entity
                    .copyWith(bodyWeight: int.tryParse(value) ?? 0));
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
                value: UserProfileInherited.of(context).entity.shirtSize,
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
                value: UserProfileInherited.of(context).entity.pantsSize,
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
              value: UserProfileInherited.of(context).entity.dressSize,
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
            child: DropdownField<int>(
                width: width,
                label: (option) => option.toString(),
                hint: 'Size giày',
                value: UserProfileInherited.of(context).entity.shoeSize,
                onSelected: (value) {
                  onChanged(UserProfileInherited.of(context)
                      .entity
                      .copyWith(shoeSize: value));
                },
                values: shoeSize),
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
            maxLength: 255,
            maxValue: 255,
            isRequired: false,
            onlyNumber: true,
            textInputType: TextInputType.numberWithOptions(),
            value: UserProfileInherited.of(context)
                .entity
                .bodyBust
                .toStringOrNull(),
            onChanged: (value) {
              onChanged(UserProfileInherited.of(context)
                  .entity
                  .copyWith(bodyBust: int.tryParse(value) ?? 0));
            },
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(width: 16.w),
        Flexible(
          child: AppTextFormField(
            label: 'Vòng 2',
            maxValue: 255,
            isRequired: false,
            onlyNumber: true,
            textInputType: TextInputType.numberWithOptions(),
            value: UserProfileInherited.of(context)
                .entity
                .bodyWaist
                .toStringOrNull(),
            onChanged: (value) {
              onChanged(UserProfileInherited.of(context)
                  .entity
                  .copyWith(bodyWaist: int.tryParse(value) ?? 0));
            },
            textInputAction: TextInputAction.next,
          ),
        ),
        SizedBox(width: 16.w),
        Flexible(
          child: AppTextFormField(
            label: 'Vòng 3',
            maxValue: 255,
            isRequired: false,
            onlyNumber: true,
            textInputType: TextInputType.numberWithOptions(),
            value: UserProfileInherited.of(context)
                .entity
                .bodyHips
                .toStringOrNull(),
            onChanged: (value) {
              onChanged(UserProfileInherited.of(context)
                  .entity
                  .copyWith(bodyHips: int.tryParse(value) ?? 0));
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ])
    ]);
  }
}
