import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_indicator.dart';

import 'image_picker_widget.dart';

class CarouselImages extends StatelessWidget {
  final List<ImageDynamic> images;
  final ValueNotifier<bool>? isWatermarking;
  const CarouselImages(
      {super.key, required this.images, required this.isWatermarking});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Swiper(
          allowImplicitScrolling: true,
          itemBuilder: (BuildContext context, int index) {
            return RepaintBoundary.wrap(
                ImageDetail(
                  image: images[index],
                ),
                index);
          },
          loop: false,
          itemCount: images.length,
          itemHeight: 100.h,
          itemWidth: 100.h,
          containerWidth: 100.h,
          containerHeight: 100.h,
          layout: SwiperLayout.STACK,
          axisDirection: AxisDirection.right,
        ),
        if (isWatermarking != null && isWatermarking!.value == true)
          ValueListenableBuilder(
              valueListenable: isWatermarking!,
              builder: (context, value, child) => Align(
                    child: AppIndicator(),
                  ))
      ],
    );
  }
}
