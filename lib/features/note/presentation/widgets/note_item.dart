import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/database/file_metadata.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/take_image_list.dart';
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
  final List<File> _image = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.squared)),
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
          widget.canTakeImge
              ? Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: TakeImage(
                    images: [],
                    limit: 5,
                    isCarousel: true,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
