import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/media/media_service.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';

class TakeImageList extends StatefulWidget {
  const TakeImageList({super.key});

  @override
  State<TakeImageList> createState() => _TakeImageListState();
}

class _TakeImageListState extends State<TakeImageList> {
  final MediaService _service = MediaService();
  final List<File> _images = [];

  Future<void> takeImage() async {
    final file = await _service.pickImage(720, 1280, 90);
    if (file != null) {
      setState(() {
        _images.add(changeFileNameOnlySync(
            File(file.path), DateTime.now().millisecondsSinceEpoch.toString()));
      });
    }
  }

  File changeFileNameOnlySync(File file, String newFileName) {
    final path = file.path;
    final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    final newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.renameSync(newPath);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => takeImage(),
            child: Container(
                padding: EdgeInsets.all(15.h),
                decoration: BoxDecoration(
                    color: AppColors.solitude,
                    borderRadius: BorderRadius.circular(6.squared)),
                child: SvgPicture.asset(
                  AppIcons.camera,
                  height: 30.h,
                )),
          ),
          SizedBox(
            width: 12.h,
          ),
          Expanded(
            child: ListView.separated(
                itemCount: _images.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                      width: 12.h,
                    ),
                itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(6.squared),
                      child: Image.file(
                        _images[index],
                        fit: BoxFit.cover,
                        height: 60.h,
                        width: 60.h,
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
