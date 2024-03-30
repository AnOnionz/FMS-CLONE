import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/widgets/bottom_sheet_notification.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/sync/sync_module.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/button/outline.dart';

void showRequiredAttendance(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredAttendance),
          title: 'Chưa chấm công ra',
          message: 'Chưa chấm công ra, bạn có chắc chắn muốn đăng xuất không ?',
          action: FlatButton(
              onPressed: () => context.pop(),
              name: 'Đăng xuất',
              color: AppColors.orange)));
}

void showRequiredSync(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredSync),
          title: 'Yêu cầu đồng bộ dữ liệu',
          message: 'Yêu cầu đồng bộ dữ liệu trước khi chấm công ra',
          action: OutlineButton(
              onPressed: () {
                context.pop();
                context.nextRoute(SyncModule.route);
              },
              name: 'Đến trang đồng bộ',
              color: AppColors.orange)));
}

void showRequiredTask(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredTask),
          title: 'Chưa hoàn thành công việc',
          message:
              'Yêu cầu hoàn thành tất cả công việc bắt buộc trong ngày trước khi chấm công ra',
          action: FlatButton(
              onPressed: () => context.pop(),
              name: 'Đăng xuất',
              color: AppColors.orange)));
}
