import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/colors.dart';

class ProfileStatusWidget extends StatelessWidget {
  final ProfileStatus? status;
  final bool read;
  final bool statusLoaded;
  final VoidCallback onUnderstand;
  final VoidCallback onReload;

  ProfileStatusWidget(
      {super.key,
      required this.status,
      required this.read,
      required this.statusLoaded,
      required this.onUnderstand,
      required this.onReload});

  Color get color =>
      status == ProfileStatus.APPROVED ? AppColors.royalBlue : AppColors.orange;

  @override
  Widget build(BuildContext context) {
    if ((statusLoaded && status == null) || read) return SizedBox();

    return Container(
      width: context.screenWidth,
      margin: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 33.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sqr), color: AppColors.white),
      child: (!statusLoaded && status == null)
          ? RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Không load được trạng thái Profile ',
                  style: context.textTheme.body1?.copyWith(color: color),
                  children: [
                    TextSpan(
                      text: 'Tải lại',
                      style: context.textTheme.subtitle1?.copyWith(
                          color: AppColors.orange,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = onReload,
                    )
                  ]))
          : (status == ProfileStatus.PENDING)
              ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          'Yêu cầu điều chỉnh hồ sơ của bạn đã được gửi thành công và đang ',
                      style: context.textTheme.body1?.copyWith(color: color),
                      children: [
                        TextSpan(
                          text: 'chờ duyệt.',
                          style: context.textTheme.subtitle1
                              ?.copyWith(color: AppColors.orange),
                        )
                      ]))
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Yêu cầu điều chỉnh hồ sơ của bạn ',
                      style: context.textTheme.body1?.copyWith(color: color),
                      children: [
                        TextSpan(
                            text: status == ProfileStatus.REJECTED
                                ? 'không được duyệt '
                                : 'đã được duyệt ',
                            style: context.textTheme.subtitle1
                                ?.copyWith(color: color)),
                        TextSpan(
                            text: status == ProfileStatus.REJECTED
                                ? ', vui lòng thử lại hoặc liên hệ cho quản lý.'
                                : 'kiểm tra lại thông tin đã được cập nhật. \n',
                            style: context.textTheme.body1
                                ?.copyWith(color: color)),
                        TextSpan(
                          text: 'Đã hiểu',
                          style: context.textTheme.subtitle1?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = onUnderstand,
                        )
                      ])),
    );
  }
}
