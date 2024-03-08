import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import 'info_text_form_field.dart';

class InfomationForm extends StatefulWidget {
  final TextEditingController customerNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController invoiceCodeController;
  const InfomationForm(
      {super.key,
      required this.customerNameController,
      required this.phoneNumberController,
      required this.invoiceCodeController});

  @override
  State<InfomationForm> createState() => _InfomationFormState();
}

class _InfomationFormState extends State<InfomationForm> {
  late final TextEditingController _nameController =
      widget.customerNameController;
  late final TextEditingController _phoneController =
      widget.phoneNumberController;
  late final TextEditingController _invoiceController =
      widget.invoiceCodeController;
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _invoiceFocus = FocusNode();

  @override
  void initState() {
    _nameFocus.addListener(_setState);
    _phoneFocus.addListener(_setState);
    _invoiceFocus.addListener(_setState);
    super.initState();
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _invoiceFocus.dispose();
    super.dispose();
  }

  void _setState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        InfoTextFormField(
          label: 'Tên khách hàng',
          controller: _nameController,
          focusNode: _nameFocus,
        ),
        SizedBox(
          height: 18.h,
        ),
        InfoTextFormField(
          label: 'Số điện thoại',
          controller: _phoneController,
          focusNode: _phoneFocus,
        ),
        SizedBox(
          height: 18.h,
        ),
        InfoTextFormField(
          label: 'Mã hóa đơn',
          controller: _invoiceController,
          focusNode: _invoiceFocus,
        ),
      ],
    ));
  }
}
