import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/widgets/bottom_sheet_notification.dart';
import 'package:fms/features/home/home_module.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/button/outline.dart';

void showSuccess(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.success),
          title: 'Chấm công thành công',
          action: OutlineButton(
              onPressed: () => context.popUntil(HomeModule.route),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}

void showFailure(BuildContext context, Failure failure, VoidCallback? onRetry) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.failure),
          title: 'Chấm công thất bại',
          message: failure.message ?? 'Phát sinh lỗi trong quá trình chấm công',
          action: OutlineButton(
              onPressed: () {
                context.pop();
                onRetry?.call();
              },
              name: 'Thử lại',
              color: AppColors.orange)));
}

void showWarning(BuildContext context, String message) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.failure),
          title: 'Thông báo',
          message: message,
          action: OutlineButton(
              onPressed: () => context.pop(),
              name: 'Đóng',
              color: AppColors.brickRed)));
}

void showRequiredInternet(BuildContext context, VoidCallback onRetry) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredInternet),
          title: 'Chấm công thất bại',
          message:
              'Kết nối mạng không ổn định, vui lòng kiểm tra lại kết nối mạng',
          action: OutlineButton(
              onPressed: onRetry, name: 'Thử lại', color: AppColors.orange)));
}

void showInfoAttendanceFailure(BuildContext context, VoidCallback onRetry) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredDownload),
          title: 'Tải dữ liệu thất bại',
          message: 'Kiểm tra lại đường truyền mạng và thử lại',
          action: OutlineButton(
              onPressed: onRetry, name: 'Thử lại', color: AppColors.orange)));
}

void showRequiredSync(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredSync),
          title: 'Chấm công thất bại',
          message: 'Yêu cầu đồng bộ dữ liệu trước khi chấm công ra',
          action: OutlineButton(
              onPressed: () {
                context.pop();
                context.nextRoute(HomeModule.route);
              },
              name: 'Đến trang đồng bộ',
              color: AppColors.orange)));
}

void showRequiredTask(BuildContext context, VoidCallback onRetry) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredTask),
          title: 'Chưa hoàn thành công việc',
          message:
              'Yêu cầu hoàn thành tất cả công việc bắt buộc trong ngày trước khi chấm công ra',
          action: OutlineButton(
              onPressed: () => context.popUntil(HomeModule.route),
              name: 'Về trang chủ',
              color: AppColors.orange)));
}
