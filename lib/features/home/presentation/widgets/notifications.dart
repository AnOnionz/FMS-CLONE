import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/bottom_sheet_notification.dart';
import '../../../../core/widgets/button/outline.dart';
import 'require_task_notify.dart';

void showRequiredAttendanceOut(VoidCallback onPressed) {
  showFailure(
    title: 'Chưa chấm công ra',
    icon: SvgPicture.asset(AppIcons.requiredTask),
    message: 'Chưa chấm công ra, bạn có chắc chắn muốn đăng xuất không ?',
    btnText: 'Đến trang chấm công',
    onPressed: onPressed,
  );
}

void showRequiredAttendanceIn(VoidCallback onPressed) {
  showFailure(
    title: 'Chưa chấm công vào',
    icon: SvgPicture.asset(AppIcons.requiredTask),
    message:
        'Chưa chấm công vào, yêu cầu chấm công trước khi vào ca làm việc ?',
    btnText: 'Đến trang chấm công',
    onPressed: onPressed,
  );
}

void showRequiredFeature(String feature, VoidCallback onPressed) {
  showWarning(
      title: 'Yêu cầu ${feature}',
      icon: SvgPicture.asset(AppIcons.requiredTask),
      btnText: 'Làm ngay',
      onPressed: onPressed);
}

void showRequiredSync(VoidCallback onPressed) {
  showFailure(
    title: 'Yêu cầu đồng bộ dữ liệu',
    icon: SvgPicture.asset(AppIcons.requiredTask),
    message: 'Yêu cầu đồng bộ dữ liệu trước khi chấm công ra',
    btnText: 'Đến trang đồng bộ',
    onPressed: onPressed,
  );
}

void showRequiredTaskBeforeLogout({required VoidCallback onPressed}) {
  showWarning(
      title: 'Chưa hoàn thành công việc',
      icon: SvgPicture.asset(AppIcons.requiredTask),
      btnText: 'Đăng xuất',
      onPressed: onPressed);
}

void showRequiredTask(
    {required List<FeatureEntity> features,
    required VoidCallback onPressed,
    bool forSignout = false}) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredTask),
          title: 'Chưa hoàn thành công việc',
          message: RequireTaskNotify(
            features: features,
            forLogout: forSignout,
          ),
          action: OutlineButton(
              onPressed: () {
                OverlayManager.hide();
                onPressed();
              },
              name: 'Về trang chủ',
              color: AppColors.orange)));
}
