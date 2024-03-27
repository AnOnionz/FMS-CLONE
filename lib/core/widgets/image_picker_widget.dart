import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/media/media_service.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';

class ImagePickerWidget extends StatefulWidget {
  final List<XFile> images;
  final int max;
  final bool isCarousel;
  final bool isWaterMark;
  final ValueNotifier<bool>? isWaterMarking;
  const ImagePickerWidget(
      {super.key,
      required this.images,
      required this.max,
      this.isCarousel = false,
      this.isWaterMark = true,
      this.isWaterMarking});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final MediaService _service = MediaService();
  late final _images = widget.images;

  Future<void> _takeImage() async {
    if (widget.images.length < widget.max) {
      final file = await _service.pickImage(720, 1280, 90);
      if (file != null) {
        //final bytes = await file.readAsBytes();
        // final length = await file.length();
        // final time = await file.lastModified();
        // final position =
        //     await Modular.get<LocationService>().getCurrentPosition();
        setState(() {
          _images.add(file);
        });

        if (widget.isWaterMark) {
          widget.isWaterMarking?.value = true;
          final fileWithWatermark = await _service.addWatermark(file);
          widget.isWaterMarking?.value = false;

          setState(() {
            _images.last = fileWithWatermark;
          });
        }
        // setState(() {
        //   _images.add(FileWithMetaData(
        //       rawPath: bytes.toList(),
        //       time: time,
        //       length: length,
        //       lat: position?.latitude,
        //       lng: position?.longitude));
        // });
      }
    }
  }

  File changeFileNameOnlySync(File file, String newFileName) {
    final path = file.path;
    final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    final newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.renameSync(newPath);
  }

  Future<void> _imagePreview(Image image) async {
    await OverlayManager.showAppDialog(
        builder: (context) => SimpleDialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(),
              contentPadding: EdgeInsets.all(4.h),
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                        width: image.width,
                        height: image.width,
                        child: FittedBox(fit: BoxFit.fill, child: image)),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: Padding(
                          padding: EdgeInsets.all(8.h),
                          child: SvgPicture.asset(
                            AppIcons.close,
                            colorFilter: ColorFilter.mode(
                                AppColors.black, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ));
  }

  @override
  void initState() {
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
              onTap: () => _takeImage(),
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
                    return FutureBuilder(
                      future: _images[index].readAsBytes(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final image = Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                            height: 60.h,
                            width: 60.h,
                          );
                          return GestureDetector(
                            onTap: () => _imagePreview(image),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.squared),
                              child: image,
                            ),
                          );
                        }
                        return SizedBox(
                          height: 60.h,
                          width: 60.h,
                          child: Icon(Icons.broken_image_outlined),
                        );
                      },
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
              onTap: () => _takeImage(),
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
                return ImageDetail(
                    image: _images[index], onPreview: _imagePreview);
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
  final XFile image;
  final Future<void> Function(Image image) onPreview;
  const ImageDetail({
    super.key,
    required this.image,
    required this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: image.readAsBytes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final imagePreview = Image.memory(
            snapshot.data!,
            fit: BoxFit.fitWidth,
          );
          return GestureDetector(
            onTap: () => onPreview(Image.memory(
              snapshot.data!,
              fit: BoxFit.contain,
            )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.squared),
              child: Container(
                // decoration: BoxDecoration(
                //     color: AppColors.white,
                //     borderRadius: BorderRadius.circular(12.squared)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                      width: 100.h,
                      child: imagePreview,
                    ),
                    // SizedBox(
                    //   height: 30.h,
                    //   width: 100.h,
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.w),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           'GPS: ${image.lat} - ${image.lng}',
                    //           style: DefaultTextStyle.of(context).style,
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               image.datetime,
                    //               style: DefaultTextStyle.of(context).style.copyWith(
                    //                   color: 'ADADAD'.toColor(),
                    //                   fontWeight: FontWeight.w400),
                    //             ),
                    //             Text(
                    //               image.lengthString,
                    //               style: DefaultTextStyle.of(context)
                    //                   .style
                    //                   .copyWith(fontWeight: FontWeight.w400),
                    //             )
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }
        return SizedBox(
          height: 100.h,
          width: 100.h,
          child: Icon(Icons.broken_image_outlined),
        );
      },
    );
  }
}
