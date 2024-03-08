import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../routes/routes.dart';
import '../widgets/receive/gift_quantity_widget.dart';

class RedeemGiftReceivePage extends StatelessWidget {
  const RedeemGiftReceivePage({super.key});

  void _showSheetLimitGift(BuildContext context) {
    OverlayManager.showSheet(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32.h, bottom: 13.h),
          child: Text('SỐ LƯỢNG QUÀ',
              style:
                  context.textTheme.h2?.copyWith(color: AppColors.nightRider)),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: RichText(
              text: TextSpan(
                  text: 'Khách hàng có thể đổi tối đa ',
                  style: context.textTheme.body1
                      ?.copyWith(color: '#252837'.toColor()),
                  children: [
                TextSpan(
                    text: '5',
                    style: context.textTheme.body1?.copyWith(
                        color: AppColors.fireBrick,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: ' quà',
                    style: context.textTheme.body1
                        ?.copyWith(color: '#252837'.toColor()))
              ])),
        ),
        FlatButton(
            onPressed: () => context.pop(),
            text: 'Xác nhận',
            color: AppColors.orange)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
          margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.squared),
                  topRight: Radius.circular(10.squared))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thông tin mua hàng',
                      style: context.textTheme.subtitle1,
                    ),
                    SvgPicture.asset(AppIcons.barcode)
                  ],
                ),
              ),
              Expanded(
                  child: CustomScrollView(
                physics: RangeMaintainingScrollPhysics(
                    parent: ClampingScrollPhysics()),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: RichText(
                              text: TextSpan(
                                  text: 'Số lượng quà khách có thể đổi là ',
                                  style: context.textTheme.body1
                                      ?.copyWith(color: AppColors.dimGray),
                                  children: [
                                TextSpan(
                                    text: '5',
                                    style: context.textTheme.body1?.copyWith(
                                        color: AppColors.fireBrick,
                                        fontWeight: FontWeight.w600))
                              ])),
                        ),
                        Divider(
                          color: 'EBEBEB'.toColor(),
                        )
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    sliver: SliverList.separated(
                      itemCount: 10,
                      itemBuilder: (context, index) => GiftQuantityWidget(
                        onLimitGift: () => _showSheetLimitGift(context),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        color: 'EBEBEB'.toColor(),
                      ),
                    ),
                  )
                ],
              )),
            ],
          ),
        )),
        Container(
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 25,
                color: AppColors.black.withOpacity(0.15))
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: FlatButton(
              onPressed: () =>
                  context.navigate(Routes.redeemGift + Routes.sampling),
              text: 'Tiếp tục',
              color: AppColors.orange,
              disableTextColor: AppColors.delRio,
              disableColor: AppColors.potPourri,
            ),
          ),
        )
      ],
    );
  }
}
