import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';
import 'customer_checkbox_group.dart';
import 'customer_radio_group.dart';
import 'customer_text_form_field.dart';

class CustomerField extends StatefulWidget {
  final FeatureCustomer featureCustomer;
  final bool isLast;
  final int index;
  final Function(List<CustomerInfo> customerInfos) callback;
  final List<CustomerInfo> customerInfos;
  const CustomerField(
      {super.key,
      required this.featureCustomer,
      required this.isLast,
      required this.callback,
      required this.customerInfos,
      required this.index});

  @override
  State<CustomerField> createState() => _CustomerFieldState();
}

class _CustomerFieldState extends State<CustomerField> {
  @override
  Widget build(BuildContext context) {
    if (widget.featureCustomer.dataType == 'checkbox')
      return CustomerCheckBoxGroup(
          onChanged: (value) {
            setState(() {
              widget.customerInfos[widget.index] = widget
                  .customerInfos[widget.index]
                  .copyWith(options: value as List<CustomerOption>?);
              widget.callback(widget.customerInfos);
            });
          },
          featureCustomer: widget.featureCustomer);
    if (widget.featureCustomer.dataType == 'radio')
      return CustomerRadioGroup(
          onChanged: (value) {
            setState(() {
              widget.customerInfos[widget.index] = widget
                  .customerInfos[widget.index]
                  .copyWith(options: value as List<CustomerOption>?);
              widget.callback(widget.customerInfos);
            });
          },
          featureCustomer: widget.featureCustomer);

    return CustomerTextFormField(
      label: widget.featureCustomer.name!,
      isRequired: widget.featureCustomer.isRequired!,
      onChanged: (value) {
        setState(() {
          widget.customerInfos[widget.index] = widget
              .customerInfos[widget.index]
              .copyWith(value: value.toString());
          widget.callback(widget.customerInfos);
        });
      },
      textInputType: widget.featureCustomer.inputType(),
      validate: widget.featureCustomer.validate(),
      textInputAction:
          widget.isLast ? TextInputAction.done : TextInputAction.next,
    );
  }
}
