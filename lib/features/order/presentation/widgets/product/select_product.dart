import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/order/presentation/widgets/product/order_product_info.dart';
import 'package:fuzzy/fuzzy.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/styles/theme.dart';
import '../../../../../core/widgets/button/flat.dart';
import '../../../../../core/widgets/custom_checkbox.dart';
import '../../../../../core/widgets/matter_container.dart';
import '../../../../../core/widgets/search_text_field.dart';

class SelectProduct extends StatefulWidget {
  final List<OrderProduct> products;
  const SelectProduct({super.key, required this.products});

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  int? selectedId;
  late List<OrderProduct> _products = widget.products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                'Chọn sản phẩm trong danh sách',
                style: context.textTheme.h2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h),
            child: SearchTextField(
              label: 'Nhập mã barcode',
              itemBuilder: (context, value) => SizedBox.shrink(),
              suggestionsCallback: (search) {
                if (search.isEmptyOrNull) {
                  if (_products != widget.products) {
                    setState(() {
                      _products = widget.products;
                    });
                  }

                  return widget.products;
                }
                final fuse = Fuzzy(
                    widget.products
                        .map((e) =>
                            (e.productPackaging!.barcode ?? '') +
                            (e.product!.name ?? ''))
                        .toList(),
                    options: FuzzyOptions(
                      tokenize: true,
                      threshold: 0.1,
                    ));

                final result = fuse.search(search).map((suggest) {
                  return widget.products.firstWhere((element) =>
                      (element.productPackaging!.barcode ?? '') +
                          (element.product!.name ?? '') ==
                      suggest.item);
                }).toList();

                setState(() {
                  _products = result;
                });

                return result;
              },
              onSelected: (value) => null,
            ),
          ),
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
              physics: kPhysics,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                  sliver: SliverList.builder(
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final orderProduct = _products[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10),
                        child: MatterContainer(
                          titleFlexible: false,
                          trailing: CustomCheckbox(
                            value: selectedId == orderProduct.id,
                            onChanged: (value) {
                              if (value)
                                selectedId = orderProduct.id;
                              else
                                selectedId = null;

                              setState(() {});
                            },
                          ),
                          leading:
                              MatterImage(url: orderProduct.product!.imageUrl),
                          title: OrderProductInfoWidget(
                              orderProduct: orderProduct),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            onPressed: selectedId != null
                ? () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    context.pop(widget.products
                        .firstWhere((element) => element.id == selectedId));
                  }
                : null,
            name: 'OK',
            color: AppColors.orange,
            disableTextColor: AppColors.delRio,
            disableColor: AppColors.potPourri,
          )
        ],
      ),
    );
  }
}
