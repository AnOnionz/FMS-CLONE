import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/cubit/identify_cubit.dart';
import 'package:fms/features/order/presentation/widgets/customer/customer_field.dart';
import 'package:fms/features/order/presentation/widgets/data_feature_widget.dart';

import '../../../../general/domain/entities/config_entity.dart';
import '../../../domain/entities/order_entity.dart';

class IdentityForm extends StatefulWidget {
  final Map<FeatureCustomer, CustomerInfo> fields;
  final IdentifyCubit identifyCubit;
  const IdentityForm({
    Key? key,
    required this.identifyCubit,
    required this.fields,
  }) : super(key: key);

  @override
  State<IdentityForm> createState() => _IdentityFormState();
}

class _IdentityFormState extends State<IdentityForm> {
  final _formKey = GlobalKey<FormState>();

  late final _fields =
      widget.fields.entries.where((field) => field.key.isIdentity!).toList();

  late final generalFeature = DataFeature.of(context).data;

  @override
  void initState() {
    super.initState();
  }

  bool validate() {
    return !_fields.any((field) {
      if (field.key.isRequired!) {
        return field.value.value.isEmptyOrNull && field.value.options == null;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
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
            Builder(builder: (context) {
              final isValidate = validate();
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

                          widget.identifyCubit.identify(
                              identifyFields:
                                  _fields.map((e) => e.value).toList(),
                              attendanceId:
                                  generalFeature.general.attendance!.id!,
                              featureId: generalFeature.feature.id!);
                        }
                      : null,
                ),
              );
            })
          ],
        ));
  }
}
