import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';

import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../domain/entities/order_entity.dart';

class CustomerRadioGroup extends StatefulWidget {
  final FeatureCustomer featureCustomer;
  final CustomerInfo customerInfo;
  final Function(List<CustomerOption> value) onChanged;

  const CustomerRadioGroup(
      {super.key,
      required this.featureCustomer,
      required this.onChanged,
      required this.customerInfo});

  @override
  State<CustomerRadioGroup> createState() => _CustomerRadioGroupState();
}

class _CustomerRadioGroupState extends State<CustomerRadioGroup> {
  late final _groupValue = widget.featureCustomer.options ?? [];

  late CustomerOption? _selectedOption =
      widget.customerInfo.options?.firstOrNull;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.featureCustomer.name != null)
          Text(widget.featureCustomer.name!),
        //
        for (final Option option in _groupValue)
          RadioListTile<int?>(
            contentPadding: EdgeInsets.zero,
            selected: _selectedOption?.featureCustomerOptionId == option.id!,
            title: Text(
              option.name ?? '',
              style: context.textTheme.body1
                  ?.copyWith(color: AppColors.black.withOpacity(0.85)),
            ),
            fillColor: MaterialStatePropertyAll(
                _selectedOption?.featureCustomerOptionId == option.id
                    ? AppColors.orange
                    : 'D9D9D9'.toColor()),
            value: option.id!,
            groupValue: _selectedOption?.featureCustomerOptionId,
            onChanged: (value) {
              setState(() {
                _selectedOption =
                    CustomerOption(featureCustomerOptionId: value);
              });

              widget.onChanged([_selectedOption!]);
            },
          )
      ],
    );
  }
}
