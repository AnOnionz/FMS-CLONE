import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/profile/presentation/widgets/custom_checkbox_group.dart';
import 'package:fms/features/profile/presentation/widgets/profile_date_picker.dart';

import '../../../../core/widgets/date_picker.dart';
import '../../../../core/widgets/image_profile.dart';
import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'dropdown_field.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation>
    with GeneralDataMixin {
  DateTime lastBirthDay = DateTime.now();
  @override
  void initState() {
    super.initState();
    getLastBirthDay();
  }

  final NetworkTimeService _timeService = Modular.get<NetworkTimeService>();

  Future<void> getLastBirthDay() async {
    final now = await _timeService.ntpDateTime();

    setState(() {
      lastBirthDay = DateTime(now.year - 15, now.month, now.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.wPerc,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16.sqr)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ImageProfile(
                  size: Size(80.w, 80.w),
                  imageUrl: general.user!.picture == null
                      ? null
                      : general.user!.picture.toString()),
              Positioned(
                right: -5.h,
                bottom: -5.h,
                child: DecoratedBox(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 6),
                        blurRadius: 18,
                        color: AppColors.black.withOpacity(0.08))
                  ]),
                  child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 20.w,
                      child: SvgPicture.asset(AppIcons.cameraProfile)),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          (general.user!.name != null)
              ? Text(
                  general.user!.name!,
                  style: context.textTheme.h3?.copyWith(color: AppColors.black),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Divider(
              color: AppColors.whisper,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child:
                  Text('Thông tin cá nhân', style: context.textTheme.subtitle1),
            ),
          ),
          AppTextFormField(
            label: 'Họ tên',
            isRequired: true,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Số điện thoại',
            isRequired: true,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'CMND/CCCD',
            isRequired: true,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Email',
            isRequired: true,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          Row(
            children: [
              Text('Giới tính:',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.midnightExpress)),
              SizedBox(width: 16.w),
              CustomCheckboxGroup<String>(
                group: ['Nam', 'Nữ'],
                onSelected: (value) {},
              ),
            ],
          ).bottom18,
          ProfileDatePicker(
                  lastDate: lastBirthDay,
                  onChanged: (time) {},
                  title: 'Ngày tháng năm sinh')
              .bottom18,
          AppTextFormField(
            label: 'Nơi sinh',
            isRequired: false,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          DropdownField(
            hint: 'Trình độ học vấn',
            values: [
              'Cao học',
              'Đại Học',
              'Cao Đẳng',
              'Trung Cấp',
              'Phổ thông trung học',
              'Khác'
            ],
            width: 100.wPerc - 80.w,
          ).bottom18,
          AppTextFormField(
            label: 'Mã số thuế',
            isRequired: false,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Số BHXH',
            isRequired: false,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
        ],
      ),
    );
  }
}
