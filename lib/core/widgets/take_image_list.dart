import 'dart:io';
import 'dart:typed_data';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/database/file_metadata.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/permission/permisson_manager.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/location/location_service.dart';
import 'package:fms/core/services/media/media_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';

class TakeImage extends StatefulWidget {
  final List<FileWithMetaData> images;
  final int max;
  final int? min;
  final bool isRequiredQuantity;
  final bool isCarousel;
  const TakeImage(
      {super.key,
      required this.images,
      required this.max,
      this.min,
      this.isRequiredQuantity = false,
      this.isCarousel = false});

  @override
  State<TakeImage> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  final MediaService _service = MediaService();
  late final _images = widget.images;

  Future<void> takeImage() async {
    if (widget.images.length < widget.max) {
      final file = await _service.pickImage(720, 1280, 90);
      if (file != null) {
        final bytes = await file.readAsBytes();
        final length = await file.length();
        final time = await file.lastModified();
        final position =
            await Modular.get<LocationService>().getCurrentPosition();

        setState(() {
          _images.add(FileWithMetaData(
              rawPath: bytes.toList(),
              time: time,
              length: length,
              lat: position?.latitude,
              lng: position?.longitude));
        });
      }
    }
  }

  File changeFileNameOnlySync(File file, String newFileName) {
    final path = file.path;
    final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    final newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.renameSync(newPath);
  }

  @override
  void initState() {
    final permissionManager = PermissionManager();
    permissionManager.requestPermission(Permission.storage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isCarousel)
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
                  itemBuilder: (context, index) {
                    print(_images[index]);
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(6.squared),
                      child: Image.memory(
                        Uint8List.fromList(_images[index].rawPath),
                        fit: BoxFit.cover,
                        height: 60.h,
                        width: 60.h,
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    return IntrinsicHeight(
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: GestureDetector(
              onTap: () => takeImage(),
              child: Container(
                height: 100.h,
                width: 100.h,
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.camera,
                    height: 50.h,
                    width: 50.h,
                  ),
                ),
                decoration: BoxDecoration(
                    color: AppColors.aliceBlue,
                    borderRadius: BorderRadius.circular(13.33.squared)),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ImageDetail(image: _images[index]);
              },
              loop: false,
              itemCount: _images.length,
              itemHeight: 100.h,
              itemWidth: 100.w,
              layout: SwiperLayout.STACK,
              axisDirection: AxisDirection.right,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageDetail extends StatelessWidget {
  final FileWithMetaData image;
  const ImageDetail({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          fontSize: 6.sp,
          height: 9.6.sp / 6.sp,
          fontWeight: FontWeight.w500,
          color: '313131'.toColor()),
      child: Builder(builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12.squared),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.squared)),
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                  width: 100.h,
                  child: Image.memory(
                    Uint8List.fromList(image.rawPath),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  width: 100.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'GPS: ${image.lat} - ${image.lng}',
                          style: DefaultTextStyle.of(context).style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              image.datetime,
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(
                                      color: 'ADADAD'.toColor(),
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              image.lengthString,
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
