import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/crawl/presentation/widgets/crawl_item.dart';
import 'package:fms/features/note/presentation/widgets/note_item.dart';

import '../../../../core/widgets/app_bar.dart';

class CrawlPage extends StatelessWidget {
  const CrawlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Giá bán sản phẩm', action: SearchButton(onPressed: () {})),
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
                          itemCount: 5,
                          itemBuilder: (context, index) => CrawlItem(),
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
                  text: 'Lưu',
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
