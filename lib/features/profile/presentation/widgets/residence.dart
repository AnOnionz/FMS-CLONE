import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/features/profile/presentation/cubit/fetch_province_cubit.dart';
import 'package:fms/features/profile/presentation/widgets/user_profile_inheriterd.dart';

import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../../work_place/domain/entities/outlet_entity.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../cubit/fetch_district_cubit.dart';
import '../cubit/fetch_ward_cubit.dart';
import 'dropdown_field.dart';

class Residence extends StatefulWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const Residence({super.key, required this.onChanged});

  @override
  State<Residence> createState() => _ResidenceState();
}

class _ResidenceState extends State<Residence>
    with AutomaticKeepAliveClientMixin {
  final provinceCubit = Modular.get<FetchProvinceCubit>();
  final districtCubit = Modular.get<FetchDistrictCubit>();
  final wardCubit = Modular.get<FetchWardCubit>();

  late final entity = UserProfileInherited.of(context).entity;

  List<Province> _provinces = [];
  List<District> _districts = [];
  List<Ward> _wards = [];

  late StreamSubscription<FetchProvinceState>? _provinceSubscription;
  late StreamSubscription<FetchDistrictState>? _districtSubscription;
  late StreamSubscription<FetchWardState>? _wardSubscription;

  @override
  void initState() {
    super.initState();
    provinceCubit.fetchProvinces();
    _provinceSubscription = provinceCubit.stream.listen((state) {
      if (state is FetchProvinceSuccess) {
        setState(() {
          _provinces = state.provinces;
        });
        Fx.log(_provinces);
      }
    });
  }

  @override
  void dispose() {
    _provinceSubscription?.cancel();
    // _districtSubscription?.cancel();
    // _wardSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: [
      DropdownField<Province>(
        hint: 'Tỉnh/Thành',
        label: (value) => value.name!,
        value: _provinces
            .firstWhereOrNull((element) => element.id == entity.province),
        values: _provinces,
        onSelected: (value) {
          widget.onChanged(entity.copyWith(province: value.id));
        },
      ).bottom18,
      DropdownField<District>(
        hint: 'Quận/huyện',
        label: (value) => value.name!,
        value: _districts
            .firstWhereOrNull((element) => element.id == entity.district),
        values: _districts,
        onSelected: (value) {
          widget.onChanged(entity.copyWith(district: value.id));
        },
      ).bottom18,
      DropdownField<Ward>(
        hint: 'Phường/Xã',
        label: (value) => value.name!,
        value: _wards.firstWhereOrNull((element) => element.id == entity.ward),
        values: _wards,
        onSelected: (value) {
          widget.onChanged(entity.copyWith(ward: value.id));
        },
      ).bottom18,
      AppTextFormField(
        label: 'Số nhà, tên đường,...',
        isRequired: false,
        onChanged: (value) {
          widget.onChanged(entity.copyWith(address: value));
        },
        textInputAction: TextInputAction.next,
      ),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
