import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/environment/env.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/app_information/presentation/widgets/row_info.dart';
import 'package:fms/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/styles/theme.dart';
import '../widgets/information_box.dart';

class AppInformationPage extends StatelessWidget with GeneralDataMixin {
  AppInformationPage({super.key});

  final credentials = Modular.get<AuthenticationRepository>().credentials;

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(height: 12.h);

    return Scaffold(
      appBar: DefaultAppBar(title: 'Thông tin và ứng dụng'),
      body: SingleChildScrollView(
        physics: kPhysics,
        child: Column(
          children: [
            SizedBox(
              height: 22.h,
            ),
            InformationBox(
              icon: Image.asset(AppImages.outlet),
              title: 'Thông tin outlet',
              children: [
                RowInfo(leading: 'Tên outlet', info: general.outlet.name ?? ''),
                space,
                RowInfo(leading: 'Mã outlet', info: general.outlet.code ?? ''),
                space,
                RowInfo(leading: 'Booth', info: general.booth.name ?? ''),
                space,
                RowInfo(leading: 'Địa chỉ', info: general.outlet.address)
              ],
            ),
            if (credentials != null)
              InformationBox(
                icon: Image.asset(AppImages.employee),
                title: 'Thông tin nhân sự',
                children: [
                  RowInfo(
                      leading: 'Tên nhân sự',
                      info: credentials!.user.name ?? ''),
                  space,
                  RowInfo(leading: 'Mã nhân sự', info: 'MA0001'),
                  space,
                  RowInfo(
                      leading: 'SĐT',
                      info: credentials!.user.phoneNumber ?? ''),
                  space,
                  RowInfo(
                      leading: 'Địa chỉ',
                      info: credentials!.user.address.toString())
                ],
              ),
            FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final packageInfo = snapshot.data!;
                    return InformationBox(
                      icon: Image.asset(AppImages.application),
                      title: 'Thông tin phần mềm',
                      children: [
                        RowInfo(
                            leading: 'Phiên bản app:',
                            info: packageInfo.version),
                        space,
                        RowInfo(
                            leading: 'Bản phát hành:',
                            info: packageInfo.buildNumber),
                        space,
                        RowInfo(leading: 'Dự án', info: packageInfo.appName),
                      ],
                    );
                  }
                  return SizedBox.shrink();
                }),
            space
          ],
        ),
      ),
    );
  }
}
