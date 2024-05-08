import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/item_container.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/widgets/advanced_text_field.dart';
import '../../../general/domain/entities/config_entity.dart';

class CrawlItem extends StatefulWidget {
  final FeatureEntity feature;
  final FeatureQuantity entity;
  final CrawlQuantitylValueEntity quantityValue;
  final void Function(String value) onChanged;
  final bool isLast;
  CrawlItem({
    super.key,
    required this.entity,
    required this.feature,
    required this.quantityValue,
    this.isLast = false,
    required this.onChanged,
  });

  @override
  State<CrawlItem> createState() => _CrawlItemState();
}

class _CrawlItemState extends State<CrawlItem> {
  bool get isItem => widget.entity.item != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16.sqr)),
      child: ItemContainer(
          leading: Image.asset(AppImages.loginBanner),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isItem
                    ? widget.entity.item!.name!
                    : widget.entity.product!.name!,
                style: context.textTheme.caption1,
              ),
              Text(
                isItem
                    ? widget.entity.item!.code!
                    : widget.entity.productPackaging!.barcode!,
                style: context.textTheme.caption2
                    ?.copyWith(color: AppColors.nobel),
              ),
              Text(
                'Loại: ${isItem ? widget.entity.item!.itemTypeName! : 'sản phẩm'}',
                style: context.textTheme.caption2
                    ?.copyWith(color: AppColors.nobel),
              )
            ],
          ),
          trailing: AdvancedTextField(
            initialValue: widget.quantityValue.value != null
                ? widget.quantityValue.value.toString()
                : null,
            onChanged: widget.onChanged,
            textInputAction:
                widget.isLast ? TextInputAction.done : TextInputAction.next,
            unit: (isItem
                    ? widget.entity.item?.unitName
                    : widget.entity.productPackaging?.unitName) ??
                'đơn vị',
          )),
    );
  }
}
