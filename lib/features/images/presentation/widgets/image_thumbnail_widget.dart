import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/cached_image.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../domain/entities/image_dynamic.dart';
import 'image_view_widget.dart';

class ImageThumbnailWidget extends StatelessWidget {
  final ImageDynamic image;
  final FeatureEntity feature;
  final VoidCallback onDeleted;
  final double? width;
  final double? height;
  const ImageThumbnailWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    required this.feature,
    required this.onDeleted,
  });

  Future<void> _imagePreview(ImageDynamic image) async {
    await OverlayManager.showAppDialog(
        builder: (context) => ImageViewWidget(
              image: image,
              feature: feature,
              onDeleted: onDeleted,
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (image.path != null)
      return GestureDetector(
        onTap: () => _imagePreview(image),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.sqr),
            child: SizedBox(
                width: width,
                height: height,
                child: Image.file(
                  File(image.path!),
                  fit: BoxFit.cover,
                ))),
      );
    else {
      return GestureDetector(
        onTap: () => _imagePreview(image),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.sqr),
            child: SizedBox(
                width: width,
                height: height,
                child: CachedImage(
                  fit: BoxFit.cover,
                  placeholder: (p0, p1) => SizedBox(
                    width: 60.h,
                    height: 60.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIndicator(),
                      ],
                    ),
                  ),
                  imageUrl:
                      image.networkImage!.getImage(image: ImageType.thumbnail),
                ))),
      );
    }
  }
}
