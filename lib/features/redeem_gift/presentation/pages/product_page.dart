import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/core/widgets/item_container.dart';
import 'package:fms/core/widgets/search_text_field.dart';
import 'package:fms/features/redeem_gift/presentation/widgets/product/concur_product.dart';
import 'package:fms/features/redeem_gift/presentation/widgets/product/select_product.dart';
import 'package:fms/routes/routes.dart';

import '../../../../core/constant/images.dart';
import '../widgets/input_quantity.dart';

class RedeemGiftProductPage extends StatefulWidget {
  const RedeemGiftProductPage({super.key});

  @override
  State<RedeemGiftProductPage> createState() => _RedeemGiftProductPageState();
}

class _RedeemGiftProductPageState extends State<RedeemGiftProductPage> {
  final items = [];

  void _showSheetConcurProduct(BuildContext context) {
    OverlayManager.showSheet(body: ConcurProduct());
  }

  void _showSheetSelectProduct(BuildContext context) {
    OverlayManager.showSheet(body: SelectProduct());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(24.h, 24.h, 16.h, 24.h),
              margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.squared)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: SearchTextField()),
                  SizedBox(width: 14.w),
                  IconButton(
                      onPressed: () => _showSheetConcurProduct(context),
                      icon: SvgPicture.asset(AppIcons.barcode)),
                  SizedBox(width: 6.w),
                  IconButton(
                      onPressed: () => _showSheetSelectProduct(context),
                      icon: SvgPicture.asset(AppIcons.hamburger)),
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(24.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.squared)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sản phẩm khách đã mua',
                            style: context.textTheme.subtitle1,
                          ),
                          SvgPicture.asset(AppIcons.help)
                        ],
                      ),
                    ),
                    Flexible(
                      child: CustomScrollView(
                        shrinkWrap: true,
                        physics: RangeMaintainingScrollPhysics(
                            parent: ClampingScrollPhysics()),
                        slivers: [
                          SliverList.separated(
                            itemCount: items.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 22.h,
                            ),
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return Dismissible(
                                key: Key(item.toString()),
                                onDismissed: (direction) {
                                  setState(() {
                                    items.removeAt(index);
                                  });
                                },
                                child: ItemContainer(
                                    titleFlexible: false,
                                    leading: Image.asset(AppImages.loginBanner),
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tên sản phẩm',
                                          style: context.textTheme.caption1,
                                        ),
                                        Text(
                                          'MA0001223',
                                          style: context.textTheme.caption2
                                              ?.copyWith(
                                                  color: AppColors.nobel),
                                        ),
                                        Text(
                                          '200.000 vnd / thùng',
                                          style: context.textTheme.caption2,
                                        )
                                      ],
                                    ),
                                    trailing: InputQuantity(
                                      max: 100,
                                    )),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
        Container(
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 25,
                color: AppColors.black.withOpacity(0.15))
          ]),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền',
                      style: context.textTheme.body1
                          ?.copyWith(color: AppColors.dimGray),
                    ),
                    Text(
                      '12,000,000 VNĐ',
                      style: context.textTheme.button1
                          ?.copyWith(color: AppColors.nero),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: FlatButton(
                  onPressed: () =>
                      context.navigate(Routes.redeemGift + Routes.customer),
                  text: 'Tiếp tục',
                  color: AppColors.orange,
                  disableTextColor: AppColors.delRio,
                  disableColor: AppColors.potPourri,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
