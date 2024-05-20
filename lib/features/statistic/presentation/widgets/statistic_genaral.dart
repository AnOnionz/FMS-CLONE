import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/image_profile.dart';
import 'package:fms/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/styles/theme.dart';
import '../../../app_information/presentation/widgets/row_info.dart';
import '../../domain/entities/statistic_entity.dart';
import '../../statistic_module.dart';
import 'statistic_type_item.dart';

class StatisticGenaral extends StatelessWidget with GeneralDataMixin {
  final StatisticEntity entity;
  final OutletEntity? outlet;
  final StatisticType type;
  const StatisticGenaral(
      {super.key, required this.entity, this.outlet, required this.type});

  Credentials get credentials =>
      Modular.get<AuthenticationRepository>().credentials!;

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
                StatisticType.outlet => OutletInfo(outlet: general.outlet),
                StatisticType.employee => OutletInfo(outlet: general.outlet),
                _ => IndividualInfo(credentials: credentials)
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
              // RowInfo(
              //   leading: 'KPI',
              //   info: '85,000/100,000',
              // ),
              // SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng sản lượng',
                info: entity.totalPurchase.toString(),
              ),
              SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng quà phát ra',
                info: entity.totalExchange.toString(),
              ),
              SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng sampling',
                info: entity.totalSampling.toString(),
              ),
            ],
          ),
        ),
        Expanded(
            child: switch (type) {
          StatisticType.outlet => EmployeesOfOutlet(),
          _ => SizedBox.shrink()
        })
      ],
    );
  }
}

class IndividualInfo extends StatelessWidget {
  final Credentials credentials;
  const IndividualInfo({super.key, required this.credentials});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageProfile(
          imageUrl: credentials.user.pictureUrl == null
              ? null
              : credentials.user.pictureUrl!.toString(),
          size: Size(80, 80),
        ),
        (credentials.user.name != null)
            ? Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Text(credentials.user.name!,
                    style:
                        context.textTheme.h3?.copyWith(color: AppColors.black)),
              )
            : SizedBox.shrink(),
        Text('MA0001',
            style: context.textTheme.body1?.copyWith(color: AppColors.nobel)),
      ],
    );
  }
}

class EmployeeInfo extends StatelessWidget {
  final EmployeeEntity employee;
  const EmployeeInfo({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageProfile(
          imageUrl: employee.user.picture,
          size: Size(80, 80),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Text(employee.user.name,
              style: context.textTheme.h3?.copyWith(color: AppColors.black)),
        ),
        Text('MA0001',
            style: context.textTheme.body1?.copyWith(color: AppColors.nobel)),
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
            outlet.name!,
            style: context.textTheme.h3?.copyWith(color: AppColors.black),
          ),
        ),
        Text(
          outlet.code!,
          style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
        ),
      ],
    );
  }
}

class EmployeesOfOutlet extends StatelessWidget {
  const EmployeesOfOutlet({super.key});

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
                        context.nextRoute(StatisticModule.employee),
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
