import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../domain/entities/image_dynamic.dart';
import 'image_thumbnail_widget.dart';

class ListViewImages extends StatelessWidget {
  final List<ImageDynamic> images;
  final Widget imagePickerButton;
  final double? height;
  final void Function(ImageDynamic image) onDeleted;
  const ListViewImages(
      {super.key,
      this.height,
      required this.images,
      required this.onDeleted,
      required this.imagePickerButton});

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth - 80.w;
    return Wrap(
      spacing: 12.h,
      runSpacing: 10.h,
      children: [
        imagePickerButton,
        ...images
            .mapIndexed((currentValue, index) => ImageThumbnailWidget(
                  height: height ?? (width - 4 * 12.h) / 5,
                  width: height ?? (width - 4 * 12.h) / 5,
                  image: images[index],
                  onDeleted: () => onDeleted(images[index]),
                ))
            .toList()
      ],
    );
  }
}
