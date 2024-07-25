import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/utilities/flex_extention.dart';
import 'package:fms/core/widgets/cached_image.dart';

import '../../features/general/domain/entities/config_entity.dart';
import '../constant/images.dart';

class Matter1Container extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget title;
  final bool titleFlexible;
  Matter1Container(
      {super.key,
      required this.trailing,
      required this.title,
      required this.leading,
      this.titleFlexible = true});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Expanded(
            child: Row(children: [
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
              Expanded(child: title),
            ]),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: trailing,
            ),
          )
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
  final bool isGameReward;
  const MatterInfoWidget(
      {super.key,
      this.product,
      this.productPackaging,
      this.item,
      this.isGameReward = false,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    final isItem = item != null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: RichText(
                text: TextSpan(
                    text: isItem ? item!.name! : product!.name!,
                    style: context.textTheme.caption1
                        ?.copyWith(color: AppColors.black),
                    children: [
              if (isGameReward == true)
                TextSpan(
                    text: ' (Quà game)',
                    style: context.textTheme.caption2
                        ?.copyWith(color: '0043CE'.toColor()))
            ]))),
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
