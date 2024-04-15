import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../report/domain/entities/report_entity.dart';
import 'note_text_field.dart';

class NoteItem extends StatefulWidget {
  final String name;
  final bool canNote;
  final bool canTakeImge;
  NoteItem(
      {super.key,
      required this.name,
      this.canNote = false,
      this.canTakeImge = false});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final TextEditingController _controller = TextEditingController();
  final List<PhotoEntity> _image = [];
  final size = Size(60.h, 60.h);
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
            '${widget.name} ',
            style: context.textTheme.h3?.copyWith(color: AppColors.black),
          ),
          widget.canNote
              ? Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: NoteTextField(
                    controller: _controller,
                  ),
                )
              : const SizedBox(),
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
