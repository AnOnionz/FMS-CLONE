import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';
import 'customer_field.dart';

class InfomationForm extends StatefulWidget {
  final GlobalKey formKey;
  final List<FeatureCustomer> featureCustomers;
  final List<CustomerInfo> customerInfos;
  final Function(List<CustomerInfo> customerOrders) callback;

  const InfomationForm(
      {super.key,
      required this.formKey,
      required this.featureCustomers,
      required this.customerInfos,
      required this.callback});

  @override
  State<InfomationForm> createState() => _InfomationFormState();
}

class _InfomationFormState extends State<InfomationForm> {
  late final featureCustomers = widget.featureCustomers
      .where((featureCustomer) => !featureCustomer.isIdentity!)
      .sorted((a, b) => a.ordinal! - b.ordinal!);

  late final List<CustomerInfo> customerInfos;

  @override
  void initState() {
    customerInfos = featureCustomers.map((e) {
      final info = widget.customerInfos.lastWhereOrNull(
          (customerInfo) => customerInfo.featureCustomerId == e.id);

      return CustomerInfo(
          featureCustomerId: e.id,
          featureCustomer: e,
          value: info?.value,
          options: info?.options);
    }).toList();

    Future.delayed(300.milliseconds, () => widget.callback(customerInfos));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...customerInfos.mapIndexed((index, currentValue) {
              final featureCustomer = featureCustomers[index];
              final isLast = index == featureCustomers.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 18.h),
                child: CustomerField(
                  featureCustomer: featureCustomer,
                  isLast: isLast,
                  index: index,
                  callback: widget.callback,
                  customerInfos: customerInfos,
                ),
              );
            }).toList(),
          ],
        ));
  }
}
