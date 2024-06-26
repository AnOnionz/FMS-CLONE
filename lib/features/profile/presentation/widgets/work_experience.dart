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
import 'package:uuid/uuid.dart';

import '../../../../core/mixins/common.dart';
import '../../../order/presentation/widgets/customer/customer_text_form_field.dart';
import 'profile_date_picker.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final _data = [_WorkExperienceEntity(canDelete: false)];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(mainAxisSize: MainAxisSize.min, children: [
          for (final e in _data)
            WorkExperienceForm(
                entity: e,
                onRemoved: () {
                  Fx.log(e.uuid);
                  setState(() {
                    _data.remove(e);
                  });
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
  const WorkExperienceForm(
      {super.key, required this.entity, required this.onRemoved});

  @override
  State<WorkExperienceForm> createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends State<WorkExperienceForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
        key: ValueKey(widget.entity.uuid),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.entity.uuid),
          Row(
            children: [
              Flexible(
                child: ProfileDatePicker(
                    lastDate: DateTime.now(),
                    onChanged: (time) {},
                    title: 'Từ ngày'),
              ),
              SizedBox(width: 16.w),
              Flexible(
                child: ProfileDatePicker(
                    lastDate: DateTime.now(),
                    onChanged: (time) {},
                    title: 'Đến ngày'),
              )
            ],
          ).bottom18,
          AppTextFormField(
            label: 'Tên công ty',
            isRequired: false,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Ngành nghề kinh doanh',
            isRequired: false,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Chức vụ',
            isRequired: false,
            onChanged: (value) {
              setState(() {});
            },
            textInputAction: TextInputAction.next,
          ).bottom18,
          AppTextFormField(
            label: 'Lý do từ chức',
            isRequired: false,
            onChanged: (value) {
              setState(() {});
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

class _WorkExperienceEntity extends Equatable {
  final bool canDelete;

  _WorkExperienceEntity({
    this.canDelete = true,
  });

  final String uuid = const Uuid().v1();

  @override
  List<Object?> get props => [uuid];
}
