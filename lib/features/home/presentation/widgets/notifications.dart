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

void showRequiredSync(VoidCallback onPressed, String feature) {
  showFailure(
    title: 'Yêu cầu đồng bộ dữ liệu',
    icon: SvgPicture.asset(AppIcons.requiredTask),
    message:
        'Vẫn còn dữ liệu chưa được đồng bộ, yêu cầu đồng bộ tất cả dữ liệu trước khi $feature.',
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
    FeatureEntity? feature}) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredTask),
          title: 'Chưa hoàn thành công việc',
          message: RequireTaskNotify(
            features: features,
            feature: feature,
          ),
          action: OutlineButton(
              onPressed: () {
                OverlayManager.hide();
                onPressed();
              },
              name: 'Về trang chủ',
              color: AppColors.orange)));
}

void showRequiredProfile({required VoidCallback onPressed}) {
  showFailure(
    title: 'Chưa có hình ảnh trong Profile',
    icon: SvgPicture.asset(AppIcons.requiredProfile),
    message:
        'Yêu cầu cập nhật hình ảnh trong Profile nhân viên để xác thực khi chấm công.',
    btnText: 'Đến Trang Profile Nhân viên',
    onPressed: onPressed,
  );
}

void showProfileInvalid({required VoidCallback onPressed}) {
  showFailure(
    title: 'Hình ảnh không hợp lệ',
    icon: SvgPicture.asset(AppIcons.profileError),
    message:
        'Không thể nhận diện gương mặt trong hình. Vui lòng chụp lại hình sao cho gương mặt bạn nằm trọn trong khung hình.',
    btnText: 'Thử lại',
    onPressed: onPressed,
  );
}

void showProfileNotMatch({required VoidCallback onPressed}) {
  showFailure(
    title: 'Gương mặt không khớp',
    icon: SvgPicture.asset(AppIcons.requiredProfile),
    message:
        'Gương mặt trong hình không khớp với thông tin hồ sơ. Vui lòng chụp lại hình với đúng người cần xác nhận.',
    btnText: 'Thử lại',
    onPressed: onPressed,
  );
}
