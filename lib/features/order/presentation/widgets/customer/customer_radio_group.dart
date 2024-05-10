import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../domain/entities/order_entity.dart';

class CustomerRadioGroup extends StatefulWidget {
  final FeatureCustomer featureCustomer;
  final Function(dynamic value) onChanged;

  const CustomerRadioGroup(
      {super.key, required this.featureCustomer, required this.onChanged});

  @override
  State<CustomerRadioGroup> createState() => _CustomerRadioGroupState();
}

class _CustomerRadioGroupState extends State<CustomerRadioGroup> {
  late final _groupValue = widget.featureCustomer.options ?? [];

  CustomerOption? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.featureCustomer.name != null)
          Text(widget.featureCustomer.name!),
        //
        for (final Option option in _groupValue)
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              option.name ?? '',
              style: context.textTheme.body1
                  ?.copyWith(color: AppColors.black.withOpacity(0.85)),
            ),
            fillColor: MaterialStatePropertyAll(_selectedOption == option
                ? AppColors.orange
                : 'D9D9D9'.toColor()),
            value: option,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption =
                    CustomerOption(featureCustomerOptionId: option.id);
              });
              widget.onChanged(_selectedOption);
            },
          )
      ],
    );
  }
}
