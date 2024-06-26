import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'dropdown_field.dart';

class Appearance extends StatefulWidget {
  const Appearance({super.key});

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
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
                setState(() {});
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
                setState(() {});
              },
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ).bottom18,
      Row(
        children: [
          Flexible(
            child: DropdownField(
                width: width,
                hint: 'Size áo',
                values: ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: AppTextFormField(
              label: 'Size quần/váy',
              isRequired: false,
              onChanged: (value) {
                setState(() {});
              },
              textInputAction: TextInputAction.next,
            ),
          )
        ],
      ).bottom18,
      Row(
        children: [
          Flexible(
            child: DropdownField(
                width: width,
                hint: 'Size đầm',
                values: ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: DropdownField(
                width: width,
                hint: 'Size giày',
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
              setState(() {});
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
              setState(() {});
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
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ])
    ]);
  }
}
