import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/report/presentation/widgets/report_item.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../domain/entities/report_entity.dart';

class ReportPage extends StatelessWidget {
  final List<ReportEntity> reportList;
  const ReportPage({super.key, required this.reportList});

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
                physics: kPhysics,
                slivers: [
                  SliverPadding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      sliver: SliverList.builder(
                        itemCount: reportList.length,
                        itemBuilder: (context, index) => ReportItem(
                          entity: reportList[index],
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
                onPressed: () {
                  reportList.any((report) {
                    if (!report.validate()) {
                      OverlayManager.showSnackbar(
                          snackbar: SnackBar(content: Text(report.name)));
                      return true;
                    }
                    return false;
                  });
                },
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
