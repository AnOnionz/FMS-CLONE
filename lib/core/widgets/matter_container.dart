import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';
import 'package:fms/core/widgets/cached_image.dart';

import '../../features/general/domain/entities/config_entity.dart';
import '../constant/images.dart';

class MatterContainer extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget title;
  final bool titleFlexible;
  MatterContainer(
      {super.key,
      required this.trailing,
      required this.title,
      required this.leading,
      this.titleFlexible = true});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
              height: 65.w,
              width: 65.w,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.roseWhite.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.sqr)),
                  ),
                  Align(alignment: Alignment.centerLeft, child: leading),
                ],
              )),
          SizedBox(
            width: 18.h,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (titleFlexible)
                Flexible(child: title)
              else
                Expanded(child: title),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: trailing,
              )
            ],
          ))
        ],
      ),
    );
  }
}

class MatterImage extends StatelessWidget {
  final String? url;
  const MatterImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null)
      return Center(
          child: Image.asset(
        AppImages.product,
        width: 40.w,
      ));
    return CachedImage(imageUrl: url!);
  }
}

class MatterInfoWidget extends StatelessWidget {
  final String asset;
  final Product? product;
  final ProductPackaging? productPackaging;
  final Item? item;
  const MatterInfoWidget(
      {super.key,
      this.product,
      this.productPackaging,
      this.item,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    final isItem = item != null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            isItem ? item!.name! : product!.name!,
            style: context.textTheme.caption1,
          ),
        ),
        Text(
          isItem ? item!.unitName! : productPackaging!.barcode!,
          style: context.textTheme.caption2?.copyWith(color: AppColors.nobel),
        ),
        Text(
          asset,
          style: context.textTheme.caption2,
        )
      ],
    );
  }
}
