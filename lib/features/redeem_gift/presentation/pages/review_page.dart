import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/redeem_gift/presentation/widgets/review/review_gift.dart';
import 'package:fms/features/redeem_gift/presentation/widgets/review/review_product.dart';
import 'package:fms/features/redeem_gift/presentation/widgets/review/review_sampling.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../routes/routes.dart';
import '../widgets/review/review_customer.dart';

class RedeemGiftReviewPage extends StatelessWidget {
  const RedeemGiftReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: CustomScrollView(
          physics:
              RangeMaintainingScrollPhysics(parent: ClampingScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: ReviewCustomer(),
            ),
            SliverToBoxAdapter(
              child: ReviewGift(),
            ),
            SliverToBoxAdapter(
              child: ReviewProduct(),
            ),
            SliverToBoxAdapter(
              child: ReviewSampling(),
            )
          ],
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
              onPressed: () => context.navigate(Routes.home),
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

  Widget _reviewContainer(BuildContext context,
      {required EdgeInsets margin, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(24.h),
      margin: margin,
      width: context.screenWidth,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.squared)),
      child: child,
    );
  }
}
