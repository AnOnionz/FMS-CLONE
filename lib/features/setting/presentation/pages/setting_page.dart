import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/setting/presentation/widgets/setting_item.dart';
import 'package:fms/routes/routes.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Cài đặt'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: Column(
          children: [
            SettingItem(
                icon: SvgPicture.asset(AppIcons.cameraOrange),
                name: 'Camera thay thế',
                type: SettingType.toggle,
                onTap: () {}),
            SettingItem(
                icon: SvgPicture.asset(AppIcons.fingerprint),
                name: 'Khóa app',
                type: SettingType.transfer,
                onTap: () => context.nextRoute(Routes.appLock)),
            SettingItem(
                icon: SvgPicture.asset(AppIcons.lock),
                name: 'Đổi mật khẩu tài khoản',
                type: SettingType.transfer,
                onTap: () {}),
            SettingItem(
                icon: SvgPicture.asset(AppIcons.trash),
                name: 'Xóa data app',
                type: SettingType.none,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
