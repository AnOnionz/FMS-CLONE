import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/profile/presentation/widgets/user_profile_inheriterd.dart';
import 'package:uuid/uuid.dart';
import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import '../../domain/entities/user_profile_entity.dart';
import 'profile_date_picker.dart';

class WorkExperience extends StatefulWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const WorkExperience({super.key, required this.onChanged});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final _data = [_WorkExperienceEntity(canDelete: false)];

  void _onChanged() {
    widget.onChanged(UserProfileInherited.of(context).entity.copyWith(
        experiences: _data
            .whereNot((workExperienceEntity) {
              final e = workExperienceEntity.experience;
              return e.endedAt == null &&
                  e.startedAt == null &&
                  e.businessLine.isEmptyOrNull &&
                  e.companyName.isEmptyOrNull &&
                  e.description.isEmptyOrNull &&
                  e.leaveReason.isEmptyOrNull &&
                  e.title.isEmptyOrNull;
            })
            .map((e) => e.experience)
            .toList()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(mainAxisSize: MainAxisSize.min, children: [
          for (final e in _data)
            WorkExperienceForm(
                entity: e,
                onChanged: _onChanged,
                onRemoved: () {
                  setState(() {
                    _data.remove(e);
                  });
                  _onChanged();
                })
        ]),
        InkWell(
          onTap: () => setState(() {
            _data.add(_WorkExperienceEntity());
          }),
          child: DottedBorder(
            dashPattern: [6, 6],
            color: AppColors.nobel,
            radius: Radius.circular(8.sqr),
            borderType: BorderType.RRect,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.sqr)),
              child: Container(
                  width: context.screenWidth,
                  padding: EdgeInsets.symmetric(vertical: 12.w),
                  child: SvgPicture.asset(
                    AppIcons.experienceAdd,
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class WorkExperienceForm extends StatefulWidget {
  final _WorkExperienceEntity entity;
  final VoidCallback onRemoved;
  final VoidCallback onChanged;
  const WorkExperienceForm(
      {super.key,
      required this.entity,
      required this.onRemoved,
      required this.onChanged});

  @override
  State<WorkExperienceForm> createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends State<WorkExperienceForm> {
  bool get _isRequired => UserProfileInherited.of(context)
      .entity
      .experiences
      .contains(widget.entity.experience);
  @override
  Widget build(BuildContext context) {
    return Column(
        key: ValueKey(widget.entity.uuid),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: ProfileDatePicker(
                    lastDate: DateTime.now(),
                    isRequired: _isRequired,
                    onChanged: (time) {
                      setState(() {
                        widget.entity.experience =
                            widget.entity.experience.copyWith(startedAt: time);
                      });
                      widget.onChanged();
                    },
                    label: 'Từ ngày'),
              ),
              SizedBox(width: 16.w),
              Flexible(
                child: ProfileDatePicker(
                    lastDate: DateTime.now(),
                    onChanged: (time) {
                      setState(() {
                        widget.entity.experience =
                            widget.entity.experience.copyWith(endedAt: time);
                      });
                      widget.onChanged();
                    },
                    label: 'Đến ngày'),
              )
            ],
          ).bottom18,
          AppTextFormField(
            label: 'Tên công ty',
            isRequired: _isRequired,
            validateMode: AutovalidateMode.always,
            onChanged: (value) {
              setState(() {
                widget.entity.experience =
                    widget.entity.experience.copyWith(companyName: value);
              });
              widget.onChanged();
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Ngành nghề kinh doanh',
            isRequired: false,
            onChanged: (value) {
              setState(() {
                widget.entity.experience =
                    widget.entity.experience.copyWith(businessLine: value);
              });
              widget.onChanged();
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Chức vụ',
            isRequired: _isRequired,
            validateMode: AutovalidateMode.always,
            onChanged: (value) {
              setState(() {
                widget.entity.experience =
                    widget.entity.experience.copyWith(title: value);
              });
              widget.onChanged();
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Lý do từ chức',
            isRequired: false,
            onChanged: (value) {
              setState(() {
                widget.entity.experience =
                    widget.entity.experience.copyWith(leaveReason: value);
              });
              widget.onChanged();
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          if (widget.entity.canDelete)
            FlatButton(
              icon: SvgPicture.asset(AppIcons.experienceRemove),
              color: 'FFF3F3'.toColor(),
              radius: 8.sqr,
              onPressed: widget.onRemoved,
            ).bottom18,
          Divider(color: AppColors.whisper).bottom18
        ]);
  }
}

// ignore: must_be_immutable
class _WorkExperienceEntity extends Equatable {
  final bool canDelete;
  Experience experience = Experience();

  _WorkExperienceEntity({
    this.canDelete = true,
  });

  final String uuid = const Uuid().v1();

  @override
  List<Object?> get props => [uuid];
}
