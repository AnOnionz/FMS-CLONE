import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../routes/routes.dart';
import '../constant/colors.dart';
import '../constant/icons.dart';
import '../widgets/bottom_sheet_notification.dart';
import '../widgets/button/outline.dart';
import 'overlay.dart';

void showSuccess(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.success),
          title: 'Lưu thành công',
          action: OutlineButton(
              onPressed: () => context.popUtil(Routes.home),
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
