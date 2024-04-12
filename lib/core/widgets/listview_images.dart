import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import 'image_picker_widget.dart';

class ListViewImages extends StatelessWidget {
  final List<ImageDynamic> images;
  final FeatureEntity feature;
  final Size size;
  final void Function(ImageDynamic image) onDeleted;
  const ListViewImages(
      {super.key,
      required this.images,
      required this.size,
      required this.feature,
      required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
              width: 8.w,
            ),
        itemBuilder: (context, index) {
          return ImageDetail(
            height: size.height,
            width: size.width,
            feature: feature,
            image: images[index],
            onDeleted: () => onDeleted(images[index]),
          );
        });
  }
}
