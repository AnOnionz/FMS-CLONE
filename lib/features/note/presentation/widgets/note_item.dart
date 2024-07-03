import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../images/presentation/widgets/image_view.dart';
import '../../../report/domain/entities/photo_entity.dart';
import '../../domain/entities/note_entity.dart';
import 'note_text_field.dart';

class NoteItem extends StatefulWidget {
  final FeatureEntity feature;
  final FeatureMultimedia entity;
  final NoteEntity note;
  final List<PhotoEntity> photos;
  final bool isWatermark;
  final ValueNotifier<bool>? isWatermarking;
  final void Function(ImageDynamic image) onPickImage;
  final void Function(ImageDynamic image) onDeleteImage;
  final void Function(String value) onChangeTextfield;
  NoteItem(
      {super.key,
      required this.entity,
      required this.feature,
      required this.note,
      required this.isWatermark,
      required this.onPickImage,
      required this.onDeleteImage,
      required this.onChangeTextfield,
      required this.photos,
      this.isWatermarking});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.note.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16.sqr)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: '${widget.entity.title} ',
                style: context.textTheme.subtitle1
                    ?.copyWith(color: AppColors.black),
                children: [
                  if (widget.entity.isTextFieldRequired!)
                    TextSpan(
                      text: ' *',
                      style: context.textTheme.subtitle1
                          ?.copyWith(color: 'FF0000'.toColor()),
                    ),
                  TextSpan(
                    text: _optinal(widget.entity.minimumImages,
                        widget.entity.maximumImages),
                    style: context.textTheme.subtitle1
                        ?.copyWith(color: AppColors.orange),
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: NoteTextField(
              controller: _controller,
              onChanged: widget.onChangeTextfield,
            ),
          ),
          if (widget.entity.maximumImages! > 0)
            Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: ListViewImages(
                  imagePickerButton: ImagePickerWidget(
                    enable: widget.photos
                            .where((element) =>
                                element.status != SyncStatus.isDeleted)
                            .length <
                        widget.entity.maximumImages!,
                    onChanged: widget.onPickImage,
                    isWatermarkRequired:
                        widget.entity.isWatermarkRequired ?? false,
                    isWatermarking: widget.isWatermarking,
                  ),
                  images: widget.photos
                      .where(
                          (element) => element.status != SyncStatus.isDeleted)
                      .map((e) => ImageDynamic(
                          id: e.id,
                          uuid: e.dataUuid,
                          noteUuid: e.dataUuid,
                          dataTimestamp: e.dataTimestamp,
                          path: e.path,
                          networkImage: e.image))
                      .toList(),
                  onDeleted: widget.onDeleteImage,
                )),
          if (widget.entity.description != null)
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                widget.entity.description!,
                style: context.textTheme.caption2,
              ),
            )
        ],
      ),
    );
  }

  String _optinal(int? min, int? max) {
    if (max == 0) return '';
    return switch (min == max) {
      true => '(bắt buộc chụp ${max} hình)',
      false => '(chụp từ ${min}-${max} hình)',
    };
  }
}
