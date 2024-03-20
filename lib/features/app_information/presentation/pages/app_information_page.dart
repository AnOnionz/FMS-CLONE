import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/app_information/presentation/widgets/row_info.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/styles/theme.dart';
import '../widgets/information_box.dart';

class AppInformationPage extends StatelessWidget {
  const AppInformationPage({super.key});

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
                RowInfo(leading: 'Tên outlet', info: 'Emart Trường Chinh'),
                space,
                RowInfo(leading: 'Mã outlet', info: 'Maoutlet001'),
                space,
                RowInfo(leading: 'Booth', info: 'A'),
                space,
                RowInfo(
                    isAddress: true,
                    leading: 'Địa chỉ',
                    info: '123, Trường Chinh, Bình Thạnh, HCM')
              ],
            ),
            InformationBox(
              icon: Image.asset(AppImages.employee),
              title: 'Thông tin nhân sự',
              children: [
                RowInfo(leading: 'Tên nhân sự', info: 'Trần Nhật Tường'),
                space,
                RowInfo(leading: 'Mã nhân sự', info: 'MA0001'),
                space,
                RowInfo(leading: 'SĐT', info: '0909090909'),
                space,
                RowInfo(
                    isAddress: true,
                    leading: 'Địa chỉ',
                    info: '123, Trường Chinh, Bình Thạnh, HCM')
              ],
            ),
            InformationBox(
              icon: Image.asset(AppImages.application),
              title: 'Thông tin phần mềm',
              children: [
                RowInfo(leading: 'Phiên bản app:', info: '1.0.0'),
                space,
                RowInfo(leading: 'Bản phát hành:', info: '2'),
                space,
                RowInfo(leading: 'Dự án', info: 'CellphoneS'),
              ],
            ),
            space
          ],
        ),
      ),
    );
  }
}
