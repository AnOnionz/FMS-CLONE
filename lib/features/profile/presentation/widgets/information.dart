import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/constant/mapper.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/media/media_service.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/features/profile/mixin_user.dart';
import 'package:fms/features/profile/presentation/widgets/custom_checkbox_group.dart';
import 'package:fms/features/profile/presentation/widgets/profile_date_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/cached_image.dart';
import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'dropdown_field.dart';

class UserInformation extends StatefulWidget with UserMixin {
  final UserProfileEntity entity;

  final Function(UserProfileEntity newValue) onChanged;
  const UserInformation(
      {super.key, required this.entity, required this.onChanged});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final _mediaService = MediaService();
  Future<DateTime> getLastBirthDay() async {
    final NetworkTimeService _timeService = Modular.get<NetworkTimeService>();
    final now = await _timeService.ntpDateTime();
    return DateTime(now.year - 15, now.month, now.day);
  }

  Photo? get portraitCloud => widget.entity.photos
      .firstWhereOrNull((element) => element.type == PhotoType.PORTRAIT);

  String? get portraitPath => widget.entity.portraitImage;

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
              (portraitCloud != null || portraitPath != null)
                  ? Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            border:
                                Border.all(color: AppColors.white, width: 2),
                            shape: BoxShape.circle),
                        child: (portraitCloud != null)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(80.w / 2),
                                child: CachedImage(
                                  fit: BoxFit.fill,
                                  errorWidget: (p0, p1, p2) =>
                                      SvgPicture.asset(AppImages.account),
                                  imageUrl: portraitCloud!.image.getImage(),
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(80.w / 2),
                                child: Image.file(
                                  File(portraitPath!),
                                  fit: BoxFit.fill,
                                )),
                      ),
                    )
                  : Image.asset(AppImages.userPortrait),
              Positioned(
                right: -5.h,
                bottom: -5.h,
                child: InkWell(
                  onTap: () {
                    OverlayManager.showSheet(
                        body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.w),
                          child: Text('Chụp trực tiếp hoặc upload từ thư viện',
                              style: context.textTheme.h3
                                  ?.copyWith(color: AppColors.nightRider)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    OverlayManager.hide();
                                    final file = await _mediaService.pickImage(
                                        720, 1280, 90);
                                    if (file != null)
                                      widget.onChanged(widget.entity
                                          .copyWith(portraitImage: file.path));
                                  },
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(AppIcons.sourceCamera),
                                      Text('Camera',
                                          style: context.textTheme.body1
                                              ?.copyWith(
                                                  color: AppColors.nightRider))
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    OverlayManager.hide();
                                    final file = await _mediaService.pickImage(
                                        source: ImageSource.gallery,
                                        720,
                                        1280,
                                        90);
                                    if (file != null)
                                      widget.onChanged(widget.entity
                                          .copyWith(portraitImage: file.path));
                                  },
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(AppIcons.image),
                                      Text('Upload',
                                          style: context.textTheme.body1
                                              ?.copyWith(
                                                  color: AppColors.nightRider))
                                    ],
                                  ),
                                )
                              ]),
                        )
                      ],
                    ));
                  },
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
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          RichText(
            text: TextSpan(
                text: 'Ảnh chân dung (1 hình) ',
                style: context.textTheme.body1
                    ?.copyWith(color: AppColors.midnightExpress),
                children: [
                  TextSpan(
                    text: ' *',
                    style: context.textTheme.body1?.copyWith(
                        color: AppColors.orange, fontWeight: FontWeight.normal),
                  ),
                ]),
          ),
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
            maxLength: 255,
            onChanged: (value) {
              widget.onChanged(widget.entity.copyWith(fullName: value));
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Số điện thoại',
            isRequired: true,
            validateMode: AutovalidateMode.onUserInteraction,
            textInputType: TextInputType.numberWithOptions(),
            validate: Mapper.dataTypeToValidate(dataType: 'phoneNumber'),
            onChanged: (value) {
              widget.onChanged(widget.entity.copyWith(phoneNumber: value));
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'CMND/CCCD',
            isRequired: true,
            textInputType: TextInputType.numberWithOptions(),
            validate: Mapper.dataTypeToValidate(dataType: 'cccd'),
            onChanged: (value) {
              widget
                  .onChanged(widget.entity.copyWith(identityCardNumber: value));
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Email',
            isRequired: true,
            textInputType: Mapper.dataTypeToInputType(dataType: 'email'),
            validate: Mapper.dataTypeToValidate(dataType: 'email'),
            onChanged: (value) {
              widget.onChanged(widget.entity.copyWith(email: value));
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          Row(
            children: [
              Text('Giới tính:',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.midnightExpress)),
              SizedBox(width: 16.w),
              CustomCheckboxGroup<GenderStatus>(
                group: [GenderStatus.MALE, GenderStatus.FEMALE],
                label: (option) => option.value,
                onSelected: (value) {
                  widget.onChanged(widget.entity.copyWith(gender: value));
                },
              ),
            ],
          ).bottom18,
          FutureBuilder(
              future: getLastBirthDay(),
              initialData: DateTime.now(),
              builder: (context, snapshot) {
                return ProfileDatePicker(
                        lastDate: snapshot.data,
                        onChanged: (time) {
                          widget.onChanged(
                              widget.entity.copyWith(birthdate: time));
                        },
                        label: 'Ngày tháng năm sinh')
                    .bottom18;
              }),
          AppTextFormField(
            label: 'Nơi sinh',
            isRequired: false,
            onChanged: (value) {
              widget.onChanged(widget.entity.copyWith(birthplace: value));
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          DropdownField(
            hint: 'Trình độ học vấn',
            label: (option) => option.value,
            values: [
              EducationLevel.PRIMARY_SCHOOL,
              EducationLevel.MIDDLE_SCHOOL,
              EducationLevel.HIGH_SCHOOL,
              EducationLevel.VOCATIONAL_TRAINING,
              EducationLevel.ASSOCIATE_DEGREE,
              EducationLevel.BACHELOR_DEGREE,
              EducationLevel.MASTER_DEGREE,
              EducationLevel.DOCTORAL_DEGREE,
              EducationLevel.POSTDOCTORAL,
              EducationLevel.OTHER
            ],
            onSelected: (value) {
              widget.onChanged(widget.entity.copyWith(educationLevel: value));
            },
            width: 100.wPerc - 80.w,
          ).bottom18,
          AppTextFormField(
            label: 'Mã số thuế',
            isRequired: false,
            onChanged: (value) {
              widget.onChanged(widget.entity.copyWith(personalTaxCode: value));
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Số BHXH',
            isRequired: false,
            onChanged: (value) {
              widget.onChanged(
                  widget.entity.copyWith(socialInsuranceNumber: value));
            },
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
