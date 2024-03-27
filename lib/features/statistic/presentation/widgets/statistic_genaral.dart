import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/image_profile.dart';
import 'package:fms/features/authentication/domain/entities/user_entity.dart';
import 'package:fms/features/authentication/domain/repositories/user_repository.dart';
import 'package:fms/features/workForce/domain/entities/booth_entity.dart';
import 'package:fms/features/workForce/domain/entities/outlet_entity.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/styles/theme.dart';
import '../../../../routes/routes.dart';
import '../../../app_information/presentation/widgets/row_info.dart';
import 'statistic_type_item.dart';

class StatisticGenaral extends StatelessWidget {
  const StatisticGenaral({super.key, required this.type});

  final StatisticType type;
  UserEntity get user => Modular.get<UserRepository>().user!;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.sqr)),
          margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              switch (type) {
                StatisticType.outlet =>
                  OutletInfo(outlet: OutletEntity(name: 'name', code: 'code')),
                StatisticType.booth => BoothInfo(
                    booth: BoothEntity(name: 'name', address: 'address')),
                _ => EmployeeInfo(user: user)
              },
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Divider(
                  color: AppColors.whisper,
                  height: 1.h,
                  endIndent: 16.w,
                  indent: 16.w,
                ),
              ),
              RowInfo(
                leading: 'KPI',
                info: '85,000/100,000',
              ),
              SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng sản lượng',
                info: '23,000',
              ),
              SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng quà phát ra',
                info: '240',
              ),
              SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng sampling',
                info: '800',
              ),
            ],
          ),
        ),
        Expanded(
            child: switch (type) {
          StatisticType.booth => EmployeesOfBooth(),
          StatisticType.outlet => BoothsOfOutlet(),
          _ => SizedBox.shrink()
        })
      ],
    );
  }
}

class EmployeeInfo extends StatelessWidget {
  final UserEntity user;
  const EmployeeInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageProfile(
          user: user,
          size: Size(80, 80),
        ),
        (user.name != null)
            ? Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Text(user.name!,
                    style:
                        context.textTheme.h3?.copyWith(color: AppColors.black)),
              )
            : SizedBox.shrink(),
        (user.zoneinfo != null)
            ? Text(user.zoneinfo!,
                style:
                    context.textTheme.body1?.copyWith(color: AppColors.nobel))
            : SizedBox.shrink(),
      ],
    );
  }
}

class OutletInfo extends StatelessWidget {
  final OutletEntity outlet;
  const OutletInfo({super.key, required this.outlet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppImages.outletBorder, height: 80, width: 80),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Text(
            outlet.name,
            style: context.textTheme.h3?.copyWith(color: AppColors.black),
          ),
        ),
        Text(
          outlet.code,
          style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
        ),
      ],
    );
  }
}

class BoothsOfOutlet extends StatelessWidget {
  const BoothsOfOutlet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h, bottom: 4.h),
          child: Text(
            'Danh sách booth trong outlet',
            style: context.textTheme.h3?.copyWith(color: AppColors.nobel),
          ),
        ),
        Flexible(
          child: CustomScrollView(
            physics: kPhysics,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(bottom: context.screenPadding.bottom),
                sliver: SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => StatisticTypeItem(
                    onPressed: () => context.nextRoute(Routes.statisticBooth),
                    title: 'Booth A',
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BoothInfo extends StatelessWidget {
  final BoothEntity booth;
  const BoothInfo({super.key, required this.booth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.outletBorder, height: 80, width: 80),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Text(
            booth.name,
            style: context.textTheme.h3?.copyWith(color: AppColors.black),
          ),
        ),
        Text(
          booth.address,
          style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
        ),
      ],
    );
  }
}

class EmployeesOfBooth extends StatelessWidget {
  const EmployeesOfBooth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Text(
            'Danh sách nhân sự làm việc tại booth',
            style: context.textTheme.h3?.copyWith(color: AppColors.black),
          ),
        ),
        Flexible(
          child: CustomScrollView(
            physics: kPhysics,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(bottom: context.screenPadding.bottom),
                sliver: SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => StatisticTypeItem(
                    onPressed: () =>
                        context.nextRoute(Routes.statisticEmployee),
                    title: 'Nguyễn Quốc An',
                    subTitle: 'ma00001',
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
