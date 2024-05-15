import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';
import 'customer_field.dart';

class InfomationForm extends StatefulWidget {
  final GlobalKey formKey;
  final Map<FeatureCustomer, CustomerInfo> fields;

  const InfomationForm(
      {super.key, required this.formKey, required this.fields});

  @override
  State<InfomationForm> createState() => _InfomationFormState();
}

class _InfomationFormState extends State<InfomationForm> {
  late final _fields =
      widget.fields.entries.where((field) => !field.key.isIdentity!).toList();

  @override
  Widget build(BuildContext context) {
    Fx.log(_fields);
    return Form(
        key: widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._fields.mapIndexed((index, entry) {
              final isLast = index == _fields.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 18.h),
                child: CustomerField(
                  onChanged: () {
                    setState(() {});
                  },
                  featureCustomer: entry.key,
                  isLast: isLast,
                  customerInfo: entry.value,
                ),
              );
            }).toList(),
          ],
        ));
  }
}
