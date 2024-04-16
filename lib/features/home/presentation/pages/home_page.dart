import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';

import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/features/home/presentation/widgets/common_feature.dart';
import 'package:fms/features/home/presentation/widgets/common_info.dart';
import 'package:fms/features/home/presentation/widgets/drawer_side.dart';
import 'package:fms/features/home/presentation/widgets/tasks.dart';

import '../../../general/presentation/bloc/general_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final bloc = Modular.get<GeneralBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerSide(),
      drawerScrimColor: AppColors.transparent,
      appBar: PreferredSize(
          preferredSize: Size(context.screenWidth, 35.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: AppBar(
              backgroundColor: Colors.amber,
              leading: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DA01-0909090909-MA001-0.1.1-10.10-ios',
                  style: context.textTheme.caption3,
                ),
              ),
              forceMaterialTransparency: true,
              leadingWidth: context.screenWidth - 40.w,
              actions: [
                Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: SvgPicture.asset(AppIcons.circleUser));
                })
              ],
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: SingleChildScrollView(
            physics: kPhysics,
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(context, 'Thông tin chung'),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 29.h, horizontal: 16.w),
                      child: CommonInfo()),
                  _title(context, 'Chức năng hỗ trợ'),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 29.h, horizontal: 16.w),
                      child: CommonFeature()),
                  _title(context, 'Danh sách công việc'),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 29.h, horizontal: 16.w),
                      child: Tasks()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context, String name) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Text(
        name,
        style: context.textTheme.h3,
      ),
    );
  }
}
