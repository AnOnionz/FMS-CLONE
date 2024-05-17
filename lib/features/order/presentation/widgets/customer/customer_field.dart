import 'package:flutter/material.dart';

import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';
import 'customer_checkbox_group.dart';
import 'customer_radio_group.dart';
import 'customer_text_form_field.dart';

class CustomerField extends StatefulWidget {
  final FeatureCustomer featureCustomer;
  final CustomerInfo customerInfo;
  final bool isLast;
  final VoidCallback onChanged;
  const CustomerField({
    super.key,
    required this.featureCustomer,
    required this.isLast,
    required this.customerInfo,
    required this.onChanged,
  });

  @override
  State<CustomerField> createState() => _CustomerFieldState();
}

class _CustomerFieldState extends State<CustomerField> {
  @override
  Widget build(BuildContext context) {
    if (widget.featureCustomer.dataType == 'checkbox')
      return CustomerCheckBoxGroup(
          customerInfo: widget.customerInfo,
          onChanged: (value) {
            setState(() {
              widget.customerInfo.options = value;
            });
            widget.onChanged();
          },
          featureCustomer: widget.featureCustomer);
    if (widget.featureCustomer.dataType == 'radio')
      return CustomerRadioGroup(
          customerInfo: widget.customerInfo,
          onChanged: (value) {
            setState(() {
              widget.customerInfo.options = value;
            });
            widget.onChanged();
          },
          featureCustomer: widget.featureCustomer);

    return CustomerTextFormField(
      customerInfo: widget.customerInfo,
      label: widget.featureCustomer.name!,
      isRequired: widget.featureCustomer.isRequired!,
      onChanged: (value) {
        setState(() {
          widget.customerInfo.value = value;
        });
        widget.onChanged();
      },
      textInputType: widget.featureCustomer.inputType(),
      validate: widget.featureCustomer.validate(),
      textInputAction:
          widget.isLast ? TextInputAction.done : TextInputAction.next,
    );
  }
}
