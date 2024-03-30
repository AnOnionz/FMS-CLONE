import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/home/home_module.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';
import '../utilities/overlay.dart';
import 'bottom_sheet_notification.dart';
import 'button/outline.dart';

void showSuccess(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.success),
          title: 'Lưu thành công',
          action: OutlineButton(
              onPressed: () => context.popUtil(HomeModule.route),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}

void showFailure(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.failure),
          title: 'Lưu thất bại',
          message: 'Yêu cầu ghi nhận đủ các trường thông tin bắt buộc',
          action: OutlineButton(
              onPressed: () => context.pop(),
              name: 'Tiếp tục ghi nhận',
              color: AppColors.orange)));
}
