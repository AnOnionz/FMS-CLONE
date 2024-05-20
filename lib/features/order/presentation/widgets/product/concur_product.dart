import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/order/presentation/widgets/product/order_product_info.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/format.dart';
import '../../../../../core/widgets/button/flat.dart';
import '../../../../../core/widgets/custom_checkbox.dart';
import '../../../../../core/widgets/matter_container.dart';
import '../../../../general/domain/entities/config_entity.dart';

class ConcurProduct extends StatefulWidget {
  final List<OrderProduct> products;

  const ConcurProduct({super.key, required this.products});

  @override
  State<ConcurProduct> createState() => _ConcurProductState();
}

class _ConcurProductState extends State<ConcurProduct> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              'Sản phẩm cùng mã barcode',
              style: context.textTheme.h2,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 26.h),
            child: CustomScrollView(
              shrinkWrap: true,
              physics: RangeMaintainingScrollPhysics(
                  parent: ClampingScrollPhysics()),
              slivers: [
                SliverList.builder(
                  itemCount: widget.products.length,
                  itemBuilder: (context, index) {
                    final orderProduct = widget.products[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
                      child: MatterContainer(
                        titleFlexible: false,
                        trailing: CustomCheckbox(
                          value: selectedIndex == index,
                          onChanged: (value) {
                            if (value)
                              selectedIndex = index;
                            else
                              selectedIndex = null;

                            setState(() {});
                          },
                        ),
                        leading:
                            MatterImage(url: orderProduct.product!.imageUrl),
                        title:
                            OrderProductInfoWidget(orderProduct: orderProduct),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        FlatButton(
          onPressed: selectedIndex != null
              ? () {
                  context.pop(widget.products[selectedIndex!]);
                }
              : null,
          name: 'OK',
          color: AppColors.orange,
          disableTextColor: AppColors.delRio,
          disableColor: AppColors.potPourri,
        )
      ],
    );
  }
}
