import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/item_container.dart';
import 'package:fms/features/redeem_gift/presentation/widgets/sampling/sampling_box.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../routes/routes.dart';
import '../../../note/presentation/widgets/advanced_text_field.dart';

class RedeemGiftSamplingPage extends StatelessWidget {
  const RedeemGiftSamplingPage({super.key});

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
                padding: EdgeInsets.only(bottom: 20.h),
                child: Text(
                  'Sampling',
                  style: context.textTheme.subtitle1,
                ),
              ),
              Expanded(
                  child: CustomScrollView(
                physics: RangeMaintainingScrollPhysics(
                    parent: ClampingScrollPhysics()),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    sliver: SliverList.separated(
                      itemCount: 10,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemBuilder: (context, index) => SamplingBox(),
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
                  context.navigate(Routes.redeemGift + Routes.review),
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
