import 'package:flutter/material.dart';

import '../../../../../core/mixins/common.dart';
import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';
import 'customer_checkbox_group.dart';
import 'customer_radio_group.dart';
import 'customer_text_form_field.dart';

class CustomerField extends StatefulWidget {
  final FeatureCustomer featureCustomer;
  final CustomerInfo customerInfo;
  final bool isLast;
  const CustomerField({
    super.key,
    required this.featureCustomer,
    required this.isLast,
    required this.customerInfo,
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
          },
          featureCustomer: widget.featureCustomer);
    if (widget.featureCustomer.dataType == 'radio')
      return CustomerRadioGroup(
          customerInfo: widget.customerInfo,
          onChanged: (value) {
            setState(() {
              widget.customerInfo.options = value;
            });
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
      },
      textInputType: widget.featureCustomer.inputType(),
      validate: widget.featureCustomer.validate(),
      textInputAction:
          widget.isLast ? TextInputAction.done : TextInputAction.next,
    );
  }
}
