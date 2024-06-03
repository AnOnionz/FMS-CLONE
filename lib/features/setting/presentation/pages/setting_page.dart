import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:fms/features/setting/presentation/widgets/setting_item.dart';
import 'package:fms/features/setting/setting_module.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final SettingCubit cubit = SettingCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Cài đặt'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: BlocBuilder<SettingCubit, SettingState>(
          bloc: cubit,
          builder: (_, state) {
            return Column(
              children: [
                SettingItem(
                    icon: SvgPicture.asset(AppIcons.cameraOrange),
                    name: 'Camera thay thế',
                    type: SettingType.toggle,
                    switchValue: state.settings.useCameraZ,
                    onTap: () {
                      cubit.cameraToggle();
                    }),
                // SettingItem(
                //     icon: SvgPicture.asset(AppIcons.fingerprint),
                //     name: 'Khóa app',
                //     type: SettingType.transfer,
                //     onTap: () => context.nextRoute(SettingModule.appLock)),
                SettingItem(
                    icon: SvgPicture.asset(AppIcons.lock),
                    name: 'Đổi mật khẩu tài khoản',
                    type: SettingType.transfer,
                    onTap: () => context.nextRoute(SettingModule.changePass)),
                // SettingItem(
                //     icon: SvgPicture.asset(AppIcons.trash),
                //     name: 'Xóa data app',
                //     type: SettingType.none,
                //     onTap: () {}),
              ],
            );
          },
        ),
      ),
    );
  }
}
