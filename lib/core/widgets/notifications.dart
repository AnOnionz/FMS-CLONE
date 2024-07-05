import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

import '../../features/home/presentation/widgets/require_task_notify.dart';
import '../constant/colors.dart';
import '../utilities/overlay.dart';
import 'bottom_sheet_notification.dart';
import 'button/outline.dart';

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

void showRequiredFaceVerified({required VoidCallback onPressed}) {
  showFailure(
    title: 'Chưa có hình ảnh trong Profile',
    icon: SvgPicture.asset(AppIcons.requiredProfileData),
    message:
        'Yêu cầu cập nhật hình ảnh trong Profile nhân viên để xác thực khi chấm công.',
    btnText: 'Đến Trang Profile Nhân viên',
    onPressed: onPressed,
  );
}

void showFaceNotFound({required VoidCallback onPressed}) {
  showFailure(
    title: 'Hình ảnh không hợp lệ',
    icon: SvgPicture.asset(AppIcons.profileError),
    message:
        'Không thể nhận diện gương mặt trong hình. Vui lòng chụp lại hình sao cho gương mặt bạn nằm trọn trong khung hình.',
    btnText: 'Thử lại',
    onPressed: onPressed,
  );
}

void showFaceNotMatch({required VoidCallback onPressed}) {
  showFailure(
    title: 'Gương mặt không khớp',
    icon: SvgPicture.asset(AppIcons.requiredProfileData),
    message:
        'Gương mặt trong hình không khớp với thông tin hồ sơ. Vui lòng chụp lại hình với đúng người cần xác nhận.',
    btnText: 'Thử lại',
    onPressed: onPressed,
  );
}

void showUploadFaceSuccess({
  required String title,
}) {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.profileSuccess),
          title: title,
          action: OutlineButton(
              onPressed: () => OverlayManager.hide(),
              name: 'Ok',
              color: AppColors.royalBlue)));
}

void showUpdateProfilePending() {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.pending),
          title: 'Gửi yêu cầu thành công',
          message: Text(
            'Yêu cầu điều chỉnh hồ sơ của bạn đã được gửi thành công và đang chờ duyệt.',
            textAlign: TextAlign.center,
            style: OverlayManager.currentContext!.textTheme.body1
                ?.copyWith(color: AppColors.nero),
          ),
          action: OutlineButton(
              onPressed: () => OverlayManager.hide(),
              name: 'Về trang chủ',
              color: AppColors.royalBlue)));
}

void showRequiredProfileField() {
  OverlayManager.showSheet(
      body: BottomSheetNotification(
          icon: SvgPicture.asset(AppIcons.requiredProfileData),
          title: 'Yêu cầu nhập đủ các trường bắt buộc',
          message: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Nhập tất cả các trường có dấu ',
                style: OverlayManager.currentContext!.textTheme.body1
                    ?.copyWith(color: AppColors.midnightExpress),
                children: [
                  TextSpan(
                    text: ' *',
                    style: OverlayManager.currentContext!.textTheme.body1
                        ?.copyWith(
                            color: AppColors.orange,
                            fontWeight: FontWeight.normal),
                  ),
                ]),
          ),
          action: OutlineButton(
              onPressed: () {
                OverlayManager.hide();
              },
              name: 'Ok',
              color: AppColors.orange)));
}

void showTakeImageMultipleSource(
    {required VoidCallback onSource1, required VoidCallback onSource2}) {
  OverlayManager.showSheet(
      body: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        child: Text('Chụp trực tiếp hoặc upload từ thư viện',
            textAlign: TextAlign.center,
            style: OverlayManager.currentContext!.textTheme.h3
                ?.copyWith(color: AppColors.nightRider)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
            onTap: () async {
              OverlayManager.hide();
              onSource1();
            },
            child: Column(
              children: [
                SvgPicture.asset(AppIcons.sourceCamera),
                Text('Camera',
                    style: OverlayManager.currentContext!.textTheme.body1
                        ?.copyWith(color: AppColors.nightRider))
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              OverlayManager.hide();
              onSource2();
            },
            child: Column(
              children: [
                SvgPicture.asset(AppIcons.image),
                Text('Upload',
                    style: OverlayManager.currentContext!.textTheme.body1
                        ?.copyWith(color: AppColors.nightRider))
              ],
            ),
          )
        ]),
      )
    ],
  ));
}
