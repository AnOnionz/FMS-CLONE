import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/bottom_sheet_notification.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/button/outline.dart';
import '../../../../routes/routes.dart';

void showSuccess(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.success),
          title: 'Chấm công thành công',
          action: OutlineButton(
              onPressed: () => context.popUtil(Routes.home),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}

void showFailure(BuildContext context) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.failure),
          title: 'Chấm công thất bại',
          message: 'Phát sinh lỗi trong quá trình chấm công',
          action: OutlineButton(
              onPressed: () => context.popUtil(Routes.home),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}
