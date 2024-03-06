import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/widgets/app_bar.dart';
import '../widgets/setting_item.dart';

class AppLockPage extends StatelessWidget {
  const AppLockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Khoá app'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: Column(
          children: [
            SettingItem(
                name: 'Đặt mã khóa', type: SettingType.toggle, onTap: () {}),
            SettingItem(name: 'Khóa app', type: SettingType.none, onTap: () {}),
            SettingItem(
                name: 'Mở khóa bằng vân tay hoặc khuôn mặt',
                type: SettingType.toggle,
                onTap: () {}),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 0),
              child: Text(
                'Trong trường hợp quên mã khóa ứng dụng bạn phải gỡ bỏ và cài đặt lại ứng dụng để xóa mật khẩu cũ. Lưu ý sau khi cài đặt lại thì các dữ liệu chưa đồng bộ sẽ bị mất.',
                style: context.textTheme.caption1
                    ?.copyWith(color: AppColors.nobel),
              ),
            )
          ],
        ),
      ),
    );
  }
}
