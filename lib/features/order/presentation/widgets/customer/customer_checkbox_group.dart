import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class CustomerCheckBoxGroup extends StatefulWidget {
  final FeatureCustomer featureCustomer;
  final CustomerInfo customerInfo;
  final Function(List<CustomerOption> value) onChanged;
  const CustomerCheckBoxGroup(
      {super.key,
      required this.featureCustomer,
      required this.onChanged,
      required this.customerInfo});

  @override
  State<CustomerCheckBoxGroup> createState() => _CustomerCheckBoxGroupState();
}

class _CustomerCheckBoxGroupState extends State<CustomerCheckBoxGroup> {
  late final _groupValue = widget.featureCustomer.options ?? [];

  late final List<CustomerOption> _selectedOptions =
      widget.customerInfo.options ?? [];

  void onOptionSelected(Option option, bool isChecked) {
    option.isChecked = isChecked;

    if (!isChecked) {
      _selectedOptions.removeWhere(
          (element) => option.id == element.featureCustomerOptionId);
    } else {
      _selectedOptions.add(CustomerOption(featureCustomerOptionId: option.id));
    }

    widget.onChanged(_selectedOptions);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.featureCustomer.name != null)
          RichText(
              text: TextSpan(
                  text: widget.featureCustomer.name!,
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.black),
                  children: [
                if (widget.featureCustomer.isRequired!)
                  TextSpan(
                      text: ' *',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.brickRed))
              ])),
        for (final Option option in _groupValue)
          CheckboxListTile(
            value: option.isChecked,
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            tristate: true,
            title: Text(
              option.name ?? '',
              style: context.textTheme.body1
                  ?.copyWith(color: AppColors.black.withOpacity(0.85)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(
                  color:
                      option.isChecked ? AppColors.orange : 'D9D9D9'.toColor()),
            ),
            fillColor: MaterialStatePropertyAll(
                option.isChecked ? AppColors.orange : AppColors.white),
            onChanged: (value) {
              onOptionSelected(option, value ?? false);
            },
          )
      ],
    );
  }
}
