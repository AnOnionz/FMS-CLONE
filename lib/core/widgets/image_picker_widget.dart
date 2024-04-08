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
import 'app_indicator.dart';

class ImagePickerWidget extends StatefulWidget {
  final ValueNotifier<List<XFile>> images;
  final int max;
  final bool isCarousel;
  final bool isWatermarkRequired;
  final ValueNotifier<bool>? isWatermarking;

  const ImagePickerWidget({
    super.key,
    required this.images,
    required this.max,
    this.isCarousel = false,
    this.isWatermarkRequired = true,
    this.isWatermarking,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final MediaService _service = MediaService();
  late final _images = widget.images;

  late ValueNotifier<bool> isWatermarking =
      widget.isWatermarking ?? ValueNotifier(false);

  Future<void> _takeImage() async {
    if (widget.images.value.length < widget.max) {
      final file = await _service.pickImage(720, 1280, 90);
      if (file != null) {
        //final bytes = await file.readAsBytes();
        // final length = await file.length();
        // final time = await file.lastModified();
        // final position =
        //     await Modular.get<LocationService>().getCurrentPosition();
        setState(() {
          _images.value.add(file);
        });

        if (widget.isWatermarkRequired) {
          isWatermarking.value = true;
          final fileWithWatermark = await _service.addWatermark(file);

          setState(() {
            _images.value.last = fileWithWatermark;
          });
          isWatermarking.value = false;
        }
        // setState(() {
        //   _images.value.add(FileWithMetaData(
        //       rawPath: bytes.toList(),
        //       time: time,
        //       length: length,
        //       lat: position?.latitude,
        //       lng: position?.longitude));
        // });
      }
    }
  }

  Future<void> _imagePreview(Image image) async {
    // showImageViewer(context, image.image, onViewerDismissed: () {
    //   print("dismissed");
    // });

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
                      borderRadius: BorderRadius.circular(6.sqr)),
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
                  itemCount: _images.value.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 12.h,
                      ),
                  itemBuilder: (context, index) {
                    return ListenableBuilder(
                      listenable: isWatermarking,
                      builder: (context, child) {
                        if (index == _images.value.length - 1 &&
                            isWatermarking.value == true) {
                          return AppIndicator(height: 30.h, width: 30.h);
                        }
                        return FutureBuilder(
                          future: _images.value[index].readAsBytes(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final image = Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              );
                              return GestureDetector(
                                onTap: () => _imagePreview(image),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.sqr),
                                  child: SizedBox(
                                      height: 60.h, width: 60.h, child: image),
                                ),
                              );
                            }
                            return SizedBox(
                              height: 60.h,
                              width: 60.h,
                              child: AppIndicator(height: 30.h, width: 30.h),
                            );
                          },
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
                    borderRadius: BorderRadius.circular(13.33.sqr)),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ImageDetail(
                    isLast: index == _images.value.length - 1,
                    isWatermarking: isWatermarking,
                    image: _images.value[index],
                    onPreview: _imagePreview);
              },
              loop: false,
              itemCount: _images.value.length,
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
  final bool isLast;
  final ValueNotifier<bool> isWatermarking;
  final Future<void> Function(Image image) onPreview;
  const ImageDetail({
    super.key,
    required this.image,
    required this.onPreview,
    required this.isLast,
    required this.isWatermarking,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: isWatermarking,
        builder: (context, child) {
          if (isLast && isWatermarking.value == true) {
            return AppIndicator(height: 30.h, width: 30.h);
          }
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
                    borderRadius: BorderRadius.circular(12.sqr),
                    child: Container(
                      // decoration: BoxDecoration(
                      //     color: AppColors.white,
                      //     borderRadius: BorderRadius.circular(12.sqr)),
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
                child: AppIndicator(height: 50.h, width: 50.h),
              );
            },
          );
        });
  }
}
