import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/crawl/presentation/widgets/crawl_item.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

import '../../../../core/widgets/app_bar.dart';

class CrawlPage extends StatelessWidget {
  final GeneralItemData entity;
  const CrawlPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: entity.feature.name!, action: SearchButton(onPressed: () {})),
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: RangeMaintainingScrollPhysics(
                      parent: ClampingScrollPhysics()),
                  slivers: [
                    SliverPadding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        sliver: SliverList.builder(
                          itemCount: entity.feature.featureQuantities!.length,
                          itemBuilder: (context, index) => CrawlItem(
                            isLast: index ==
                                entity.feature.featureQuantities!.length - 1,
                            entity: entity.feature.featureQuantities![index],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 25,
                      color: AppColors.black.withOpacity(0.15))
                ]),
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                child: FlatButton(
                  onPressed: () {},
                  name: 'Lưu',
                  color: AppColors.orange,
                  disableColor: AppColors.potPourri,
                  disableTextColor: AppColors.delRio,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
