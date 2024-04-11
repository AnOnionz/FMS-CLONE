import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import 'package:fms/core/services/media/media_service.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';

class ImageDynamic extends Equatable {
  final String uuid;
  final List<int>? rawData;
  final ImageCloud? networkImage;

  ImageDynamic(
      {required this.uuid, required this.rawData, required this.networkImage});

  @override
  List<Object?> get props => [uuid];
}

class ImagePickerWidget extends StatefulWidget {
  final bool enable;
  final bool isWatermarkRequired;
  final void Function(XFile file) onChanged;
  final ValueNotifier<bool>? isWatermarking;
  final double? width;
  final double? height;

  const ImagePickerWidget(
      {super.key,
      required this.enable,
      this.isWatermarkRequired = true,
      this.isWatermarking,
      required this.onChanged,
      this.width,
      this.height});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final MediaService _service = MediaService();

  late ValueNotifier<bool> isWatermarking =
      widget.isWatermarking ?? ValueNotifier(false);

  Future<void> _takeImage() async {
    final file = await _service.pickImage(720, 1280, 90);
    if (file != null) {
      if (widget.isWatermarkRequired) {
        isWatermarking.value = true;
        try {
          final fileWithWatermark = await _service.addWatermark(file);
          isWatermarking.value = false;
          widget.onChanged(fileWithWatermark);
        } catch (e) {
          isWatermarking.value = false;
        }
      } else {
        widget.onChanged(file);
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
                    Align(
                      child: Container(
                          width: image.width,
                          height: image.height,
                          child: FittedBox(fit: BoxFit.fill, child: image)),
                    ),
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
    return GestureDetector(
      onTap: () => widget.enable ? _takeImage() : null,
      child: Container(
        height: widget.height ?? 100.h,
        width: widget.width ?? 100.h,
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
    );
  }
}

class ImageDetail extends StatelessWidget {
  final ImageDynamic image;
  final double? width;
  final double? height;
  const ImageDetail({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (image.rawData != null)
      return Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.sqr),
            child: SizedBox(
                width: width ?? 100.h,
                height: height ?? 100.h,
                child: Image.memory(Uint8List.fromList(image.rawData!)))),
      );
    else {
      return Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.sqr),
            child: SizedBox(
                width: width ?? 100.h,
                height: height ?? 100.h,
                child: Image.network(image.networkImage!.variants!.first))),
      );
    }
  }
}
