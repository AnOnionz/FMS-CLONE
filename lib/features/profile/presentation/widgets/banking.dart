import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/profile/domain/entities/bank_entity.dart';
import 'package:fms/features/profile/presentation/cubit/fetch_bank_cubit.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'dropdown_field.dart';
import 'user_profile_inheriterd.dart';

class Banking extends StatefulWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const Banking({super.key, required this.onChanged});

  @override
  State<Banking> createState() => _BankingState();
}

class _BankingState extends State<Banking> {
  final _bankCubit = Modular.get<FetchBankCubit>();
  late StreamSubscription<FetchBankState>? _bankSubscription;
  final TextEditingController _bankController = TextEditingController();

  List<BankEntity> _banks = [];
  BankEntity? _bankSelected;

  @override
  void initState() {
    super.initState();
    _bankCubit.fetchBanks();
    _bankSubscription = _bankCubit.stream.listen((state) {
      if (state is FetchBankSuccess) {
        setState(() {
          _banks = state.banks;
          _bankSelected = _banks.firstWhereOrNull((element) =>
              element.id == UserProfileInherited.of(context).entity.bank?.id);
        });
      }
      if (state is FetchBankFailure) {
        _bankCubit.fetchBanks();
      }
    });
  }

  @override
  void didChangeDependencies() {
    final entity = UserProfileInherited.of(context).entity;

    setState(() {
      _bankSelected =
          _banks.firstWhereOrNull((element) => element.id == entity.bank?.id);
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bankSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Đây là thông tin để chuyển lương, nhân viên vui lòng cung cấp chính xác.',
        style: context.textTheme.caption1
            ?.copyWith(color: AppColors.orange, fontStyle: FontStyle.italic),
      ).bottom18,
      DropdownField<BankEntity>(
        controller: _bankController,
        hint: 'Ngân hàng',
        enableSearch: true,
        label: (value) => value.shortName,
        value: _bankSelected,
        values: _banks,
        onSelected: (value) {
          FocusManager.instance.primaryFocus?.unfocus();

          widget.onChanged(
              UserProfileInherited.of(context).entity.copyWith(bank: value));
        },
      ).bottom18,
      AppTextFormField(
        label: 'Chi nhánh',
        isRequired: false,
        maxLength: 255,
        value: UserProfileInherited.of(context).entity.bankBranch,
        onChanged: (value) {
          widget.onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(bankBranch: value));
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Số tài khoản',
        isRequired: false,
        onlyNumber: true,
        maxLength: 20,
        value: UserProfileInherited.of(context).entity.bankAccountNumber,
        onChanged: (value) {
          widget.onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(bankAccountNumber: value));
        },
        textInputAction: TextInputAction.next,
      ).bottom18,
      AppTextFormField(
        label: 'Họ và tên',
        isRequired: false,
        maxLength: 255,
        value: UserProfileInherited.of(context).entity.bankAccountName,
        onChanged: (value) {
          widget.onChanged(UserProfileInherited.of(context)
              .entity
              .copyWith(bankAccountName: value));
        },
        textInputAction: TextInputAction.next,
      ),
    ]);
  }
}
