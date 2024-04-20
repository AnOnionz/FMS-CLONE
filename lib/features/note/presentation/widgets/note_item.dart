import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../core/constant/colors.dart';
import '../../../images/presentation/widgets/images.dart';
import '../../domain/entities/note_entity.dart';
import 'note_text_field.dart';

class NoteItem extends StatefulWidget {
  final FeatureEntity feature;
  final FeatureMultimedia entity;
  final NoteEntity note;
  final bool isWatermark;
  final void Function(ImageDynamic image) onAdded;
  final void Function(ImageDynamic image) onDeleted;
  NoteItem(
      {super.key,
      required this.entity,
      required this.feature,
      required this.note,
      required this.isWatermark,
      required this.onAdded,
      required this.onDeleted});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final TextEditingController _controller = TextEditingController();

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
          Text(
            '${widget.entity.title} ',
            style: context.textTheme.h3?.copyWith(color: AppColors.black),
          ),
          if (widget.entity.isTextFieldRequired!)
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: NoteTextField(
                controller: _controller,
              ),
            ),
          Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: ListViewImages(
                feature: widget.feature,
                imagePickerButton: ImagePickerWidget(
                  enable:
                      widget.note.photos.length < widget.entity.maximumImages!,
                  onChanged: widget.onAdded,
                  isWatermarkRequired:
                      widget.entity.isWatermarkRequired ?? false,
                ),
                images: widget.note.photos
                    .map((e) => ImageDynamic(
                        id: e.id,
                        uuid: e.dataUuid,
                        noteUuid: widget.note.dataUuid,
                        dataTimestamp: e.dataTimestamp,
                        path: e.path,
                        networkImage: e.image))
                    .toList(),
                onDeleted: widget.onDeleted,
              )),

          // widget.canTakeImge
          //     ? Padding(
          //         padding: EdgeInsets.only(top: 16.h),
          //         child: SizedBox(
          //           height: size.height,
          //           child: Row(
          //             children: [
          //               ImagePickerWidget(
          //                 enable: photos.length < entity.maximum!,
          //                 onChanged: onAdded,
          //                 isWatermarkRequired: isWatermark,
          //                 isWatermarking: isWatermarking,
          //               ),
          //               SizedBox(width: 16.w),
          //               Expanded(
          //                 child: ListViewImages(
          //                   feature: feature,
          //                   size: imageSize,
          //                   images: photos
          //                       .map((e) => ImageDynamic(
          //                           id: e.id,
          //                           uuid: e.dataUuid,
          //                           dataTimestamp: e.dataTimestamp,
          //                           path: e.path,
          //                           networkImage: e.image))
          //                       .toList(),
          //                   onDeleted: onDeleted,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }
}
