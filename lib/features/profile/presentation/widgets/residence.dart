import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/mapper.dart';
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
  final bool isPermanent;
  final Function(UserProfileEntity newValue) onChanged;
  const Residence({
    super.key,
    required this.onChanged,
    this.isPermanent = false,
  });

  @override
  State<Residence> createState() => _ResidenceState();
}

class _ResidenceState extends State<Residence> {
  final provinceCubit = Modular.get<FetchProvinceCubit>();
  final districtCubit = Modular.get<FetchDistrictCubit>();
  final wardCubit = Modular.get<FetchWardCubit>();

  List<Province> _provinces = [];
  List<District> _districts = [];
  List<Ward> _wards = [];

  late ValueNotifier<Province?> _provinceSelected = ValueNotifier(null);
  late ValueNotifier<District?> _districtSelected = ValueNotifier(null);
  late ValueNotifier<Ward?> _wardSelected = ValueNotifier(null);

  late StreamSubscription<FetchProvinceState>? _provinceSubscription;
  late StreamSubscription<FetchDistrictState>? _districtSubscription;
  late StreamSubscription<FetchWardState>? _wardSubscription;

  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _wardController = TextEditingController();

  @override
  void initState() {
    provinceCubit.fetchProvinces();
    _provinceSubscription = provinceCubit.stream.listen((state) {
      if (state is FetchProvinceSuccess) {
        setState(() {
          _provinces = state.provinces;
        });
      }
      if (state is FetchProvinceFailure) {
        provinceCubit.fetchProvinces();
      }
    });
    _districtSubscription = districtCubit.stream.listen((state) {
      if (state is FetchDistrictSuccess) {
        setState(() {
          _districts = state.districts;
        });
      }
      if (state is FetchDistrictFailure) {
        districtCubit.fetchDistricts(provinceId: _provinceSelected.value!.id!);
      }
    });
    _wardSubscription = wardCubit.stream.listen((state) {
      if (state is FetchWardSuccess) {
        setState(() {
          _wards = state.wards;
        });
      }
      if (state is FetchWardFailure) {
        wardCubit.fetchWards(
            provinceId: _provinceSelected.value!.id!,
            districtId: _districtSelected.value!.id!);
      }
    });

    _provinceSelected.addListener(_fetchDistricts);
    _districtSelected.addListener(_fetchWards);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final entity = UserProfileInherited.of(context).entity;

    updateProvince(entity);
    updateDistrict(entity);
    updateWard(entity);

    super.didChangeDependencies();
  }

  void _fetchDistricts() {
    if (_districtSelected.value == null) {
      setState(() {
        _districts = [];
      });
    }
    if (_provinceSelected.value != null)
      districtCubit.fetchDistricts(provinceId: _provinceSelected.value!.id!);
  }

  void _fetchWards() {
    if (_wardSelected.value == null) {
      setState(() {
        _wards = [];
      });
    }
    if (_provinceSelected.value != null && _districtSelected.value != null)
      wardCubit.fetchWards(
          provinceId: _provinceSelected.value!.id!,
          districtId: _districtSelected.value!.id!);
  }

  void onProvinceSelected(Province province) {
    _provinceSelected.value = province;
    _districtSelected.value = null;
    _wardSelected.value = null;
    _districtController.clear();
    _wardController.clear();
    setState(() {});
  }

  void onDistrictSelected(District district) {
    _districtSelected.value = district;
    _wardSelected.value = null;
    _wardController.clear();
    setState(() {});
  }

  void onWardSelected(Ward ward) {
    _wardSelected.value = ward;
  }

  void updateProvince(UserProfileEntity entity) {
    _provinceSelected.value =
        widget.isPermanent ? entity.permanentProvince : entity.province;
    if (_provinceSelected.value != null)
      _provinceController.text = _provinceSelected.value!.name!;
  }

  void updateDistrict(UserProfileEntity entity) {
    _districtSelected.value =
        widget.isPermanent ? entity.permanentDistrict : entity.district;
    if (_districtSelected.value != null)
      _districtController.text = _districtSelected.value!.name!;
  }

  void updateWard(UserProfileEntity entity) {
    _wardSelected.value =
        widget.isPermanent ? entity.permanentWard : entity.ward;
    if (_wardSelected.value != null)
      _wardController.text = _wardSelected.value!.name!;
  }

  @override
  void dispose() {
    _provinceSubscription?.cancel();
    _districtSubscription?.cancel();
    _wardSubscription?.cancel();
    _provinceSelected.removeListener(_fetchDistricts);
    _districtSelected.removeListener(_fetchWards);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DropdownField<Province>(
        controller: _provinceController,
        hint: 'Tỉnh/Thành phố',
        enableSearch: true,
        label: (value) => value.name!,
        value: _provinceSelected.value,
        values: _provinces,
        onSelected: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
          onProvinceSelected(value);
          if (widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context).entity.copyWith(
                permanentProvince: Value(object: value),
                permanentDistrict: Value(object: null),
                permanentWard: Value(object: null)));
          if (!widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context).entity.copyWith(
                province: Value(object: value),
                district: Value(object: null),
                ward: Value(object: null)));
        },
      ).bottom18,
      DropdownField<District>(
        controller: _districtController,
        hint: 'Quận/Huyện',
        label: (value) => value.name!,
        value: _districtSelected.value,
        values: _districts,
        onSelected: (value) {
          onDistrictSelected(value);
          if (widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context).entity.copyWith(
                permanentDistrict: Value(object: value),
                permanentWard: Value(object: null)));
          if (!widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context).entity.copyWith(
                district: Value(object: value), ward: Value(object: null)));
        },
      ).bottom18,
      DropdownField<Ward>(
        controller: _wardController,
        hint: 'Phường/Xã',
        label: (value) => value.name!,
        value: _wardSelected.value,
        values: _wards,
        onSelected: (value) {
          onWardSelected(value);
          if (widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context)
                .entity
                .copyWith(permanentWard: Value(object: value)));
          if (!widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context)
                .entity
                .copyWith(ward: Value(object: value)));
        },
      ).bottom18,
      AppTextFormField(
        label: 'Số nhà, tên đường,...',
        isRequired: false,
        value: (widget.isPermanent)
            ? UserProfileInherited.of(context).entity.permanentAddress
            : UserProfileInherited.of(context).entity.address,
        onChanged: (value) {
          if (widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context)
                .entity
                .copyWith(permanentAddress: value));
          if (!widget.isPermanent)
            widget.onChanged(UserProfileInherited.of(context)
                .entity
                .copyWith(address: value));
        },
        textInputAction: TextInputAction.next,
      ),
    ]);
  }
}
