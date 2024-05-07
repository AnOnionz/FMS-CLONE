import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/search_text_field.dart';
import 'package:fms/features/order/presentation/widgets/product/concur_product.dart';
import 'package:fms/features/order/presentation/widgets/product/select_product.dart';

import '../widgets/bottom_buttons.dart';
import '../widgets/product/selected_product.dart';

class RedeemGiftProductPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const RedeemGiftProductPage(
      {super.key, required this.onNext, required this.onBack});

  @override
  State<RedeemGiftProductPage> createState() => _RedeemGiftProductPageState();
}

class _RedeemGiftProductPageState extends State<RedeemGiftProductPage>
    with AutomaticKeepAliveClientMixin {
  final items = [];

  void _showSheetConcurProduct(BuildContext context) {
    OverlayManager.showSheet(body: ConcurProduct());
  }

  void _showSheetSelectProduct(BuildContext context) {
    OverlayManager.showSheet(body: SelectProduct());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  borderRadius: BorderRadius.circular(10.sqr)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: SearchTextField<int>(
                    label: 'Nhập mã barcode',
                    itemBuilder: (context, value) => Material(
                      type: MaterialType.transparency,
                      child: ListTile(
                        focusColor: '#FBF6F4'.toColor(),
                        hoverColor: '#FBF6F4'.toColor(),
                        splashColor: '#FBF6F4'.toColor(),
                        selectedColor: '#FBF6F4'.toColor(),
                        selectedTileColor: '#FBF6F4'.toColor(),
                        title: Text(
                          'Tên sản phẩm 1',
                          style: context.textTheme.caption1,
                        ),
                        trailing: Text('MA0001223',
                            style: context.textTheme.caption2
                                ?.copyWith(color: AppColors.nobel)),
                      ),
                    ),
                    suggestionsCallback: (search) async {
                      if (search.isEmpty || search == '') {
                        return [];
                      }
                      return await Future<List<int>>.value([
                        1,
                        2,
                        3,
                      ]);
                    },
                    onSelected: (value) {
                      debugPrint('Selected suggestion: $value');
                    },
                  )),
                  SizedBox(width: 4.w),
                  IconButton(
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () => _showSheetConcurProduct(context),
                      icon: SvgPicture.asset(AppIcons.barcode)),
                  SizedBox(width: 0.w),
                  IconButton(
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
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
                    borderRadius: BorderRadius.circular(10.sqr)),
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
                      child: SelectedProduct(
                        state: this,
                        items: [],
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
                child: BottomButtons(
                  onBack: widget.onBack,
                  onNext: widget.onNext,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
