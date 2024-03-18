import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/report/presentation/widgets/report_item.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/button/flat.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Chụp hình report'),
      body: Padding(
        padding: EdgeInsets.only(top: 26.h),
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
                        itemCount: 3,
                        itemBuilder: (context, index) => ReportItem(
                          name: 'Hình tổng quan',
                          max: 5,
                          min: 3,
                          description:
                              'Hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình hướng dẫn chụp hình ',
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
    );
  }
}
