import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/widgets/bottom_sheet_notification.dart';
import 'package:fms/core/widgets/button/flat.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/button/outline.dart';

void showSuccess(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.success),
          title: 'Đồng bộ thành công',
          action: FlatButton(
              onPressed: () => context.pop(),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}

void showFailure(BuildContext context, VoidCallback retry) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.failure),
          title: 'Đồng bộ thất bại',
          message: 'Phát sinh lỗi trong quá trình đồng bộ',
          action: OutlineButton(
              onPressed: () {
                context.pop();
                retry();
              },
              name: 'Thử lại',
              color: AppColors.orange)));
}

void showRequiredInternet(BuildContext context, VoidCallback retry) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredInternet),
          title: 'Đồng bộ thất bại',
          message:
              'Kết nối mạng không ổn định, vui lòng kiểm tra lại kết nối mạng',
          action: OutlineButton(
              onPressed: () {
                context.pop();
                retry();
              },
              name: 'Thử lại',
              color: AppColors.orange)));
}
