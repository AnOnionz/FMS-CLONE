import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';
import 'customer_text_form_field.dart';

class IdentityForm extends StatefulWidget {
  final List<FeatureCustomer> featureCustomers;
  final Function(List<CustomerInfo> customerOrders) callback;
  final VoidCallback onIdentify;
  const IdentityForm({
    Key? key,
    required this.featureCustomers,
    required this.callback,
    required this.onIdentify,
  }) : super(key: key);

  @override
  State<IdentityForm> createState() => _IdentityFormState();
}

class _IdentityFormState extends State<IdentityForm> {
  final _formKey = GlobalKey<FormState>();

  late final featureCustomers = widget.featureCustomers
      .where((featureCustomer) => featureCustomer.isIdentity!)
      .sorted((a, b) => a.ordinal! - b.ordinal!);

  late final List<CustomerInfo> customerOrders;

  @override
  void initState() {
    customerOrders = featureCustomers
        .map((e) => CustomerInfo(featureCustomerId: e.id, featureCustomer: e))
        .toList();
    Future.delayed(300.milliseconds, () => widget.callback(customerOrders));
    super.initState();
  }

  bool validate(CustomerInfo customerInfo) {
    if (customerInfo.featureCustomer!.isRequired!) {
      return !customerInfo.value.isEmptyOrNull || customerInfo.options != null;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...customerOrders.mapIndexed((index, currentValue) {
              final featureCustomer = featureCustomers[index];
              final islast = index == customerOrders.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: islast ? 0 : 18.h),
                child: CustomerTextFormField(
                  label: featureCustomer.name!,
                  isRequired: featureCustomer.isRequired!,
                  onChanged: (value) {
                    setState(() {
                      customerOrders[index] = customerOrders[index]
                          .copyWith(value: value.toString());
                      widget.callback(customerOrders);
                    });
                  },
                  textInputType: featureCustomer.inputType(),
                  textInputAction:
                      islast ? TextInputAction.done : TextInputAction.next,
                ),
              );
            }).toList(),
            Builder(builder: (context) {
              final isValidate =
                  customerOrders.every((element) => validate(element));
              return Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: MaterialButton(
                  elevation: 0,
                  disabledElevation: 0,
                  disabledColor: 'F5F6F8'.toColor(),
                  color: 'F5F6F8'.toColor(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sqr)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.search1,
                          colorFilter: isValidate
                              ? null
                              : ColorFilter.mode(
                                  '#CCC6D9'.toColor(), BlendMode.srcIn),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Kiểm tra thông tin',
                          style: context.textTheme.button2?.copyWith(
                              color: isValidate
                                  ? '#42526E'.toColor()
                                  : '#CCC6D9'.toColor()),
                        )
                      ],
                    ),
                  ),
                  onPressed: isValidate
                      ? () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          widget.onIdentify();
                        }
                      : null,
                ),
              );
            })
          ],
        ));
  }
}
