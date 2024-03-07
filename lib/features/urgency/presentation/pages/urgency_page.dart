import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/urgency/presentation/widgets/urgency_history.dart';

import '../../../../core/utilities/overlay.dart';
import '../widgets/urgency_item.dart';

class UrgencyPage extends StatelessWidget {
  const UrgencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _showSheetHistoryUrgency() {
      OverlayManager.showSheet(
          body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Text(
                  'Lịch sử báo cáo khẩn',
                  style: context.textTheme.h2,
                ),
              ),
            ),
            Expanded(child: UrgencyHistory()),
          ],
        ),
      ));
    }

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Báo cáo khẩn',
        action: HistoryButton(onPressed: () => _showSheetHistoryUrgency()),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 22.h),
        child: Column(
          children: [
            UrgencyItem(
              name: 'Đi vệ sinh',
            ),
            UrgencyItem(
              name: 'Đi ăn',
            ),
            UrgencyItem(
              name: 'Tiếp khách hàng',
            ),
            UrgencyItem(
              name: 'Kiểm tra',
            ),
          ],
        ),
      ),
    );
  }
}
