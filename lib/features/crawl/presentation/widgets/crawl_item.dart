import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/item_container.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/widgets/advanced_text_field.dart';
import '../../../general/domain/entities/config_entity.dart';

class CrawlItem extends StatefulWidget {
  final FeatureQuantity entity;
  final bool isLast;
  CrawlItem({
    super.key,
    required this.entity,
    this.isLast = false,
  });

  @override
  State<CrawlItem> createState() => _CrawlItemState();
}

class _CrawlItemState extends State<CrawlItem> {
  final TextEditingController _controller = TextEditingController();

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
                'Tên sản phẩm',
                style: context.textTheme.caption1,
              ),
              Text(
                'MA0001223',
                style: context.textTheme.caption2
                    ?.copyWith(color: AppColors.nobel),
              ),
              Text(
                'Loại: posm',
                style: context.textTheme.caption2
                    ?.copyWith(color: AppColors.nobel),
              )
            ],
          ),
          trailing: AdvancedTextField(
            controller: _controller,
            textInputAction:
                widget.isLast ? TextInputAction.done : TextInputAction.next,
            unit: widget.entity.productPackaging?.unitName ?? 'vnđ',
          )),
    );
  }
}
