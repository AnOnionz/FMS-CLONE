import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/data_load_error_widget.dart';
import 'package:fms/core/widgets/image_profile.dart';
import 'package:fms/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';
import 'package:fms/features/statistic/presentation/cubit/team_members_cubit.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/styles/theme.dart';
import '../../../app_information/presentation/widgets/row_info.dart';
import '../../domain/entities/statistic_entity.dart';
import '../../statistic_module.dart';
import 'statistic_type_item.dart';

class StatisticGenaral extends StatefulWidget {
  final GeneralFeatureData entity;
  final StatisticEntity statisticEntity;
  final OutletEntity? outlet;
  final EmployeeEntity? employee;
  final StatisticType type;
  const StatisticGenaral(
      {super.key,
      required this.statisticEntity,
      this.outlet,
      required this.type,
      required this.entity,
      this.employee});

  @override
  State<StatisticGenaral> createState() => _StatisticGenaralState();
}

class _StatisticGenaralState extends State<StatisticGenaral>
    with AutomaticKeepAliveClientMixin, GeneralDataMixin {
  Credentials get credentials =>
      Modular.get<AuthenticationRepository>().credentials!;

  final _cubit = Modular.get<TeamMembersCubit>();

  @override
  void initState() {
    fetchTeamMembers();
    super.initState();
  }

  void fetchTeamMembers() {
    if (widget.type == StatisticType.outlet)
      _cubit.getTeamMembers(widget.entity.feature.id!);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              switch (widget.type) {
                StatisticType.outlet =>
                  OutletInfo(outlet: general!.outlet, booth: general!.booth),
                StatisticType.employee =>
                  IndividualInfo(employeeEntity: widget.employee),
                StatisticType.individual =>
                  IndividualInfo(credentials: credentials)
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
                leading: 'Tổng sản phẩm',
                info: widget.statisticEntity.totalPurchase.toString(),
              ),
              SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng quà phát ra',
                info: widget.statisticEntity.totalExchange.toString(),
              ),
              SizedBox(height: 12.h),
              RowInfo(
                leading: 'Tổng sampling',
                info: widget.statisticEntity.totalSampling.toString(),
              ),
            ],
          ),
        ),
        if (widget.type == StatisticType.outlet)
          Expanded(
              child: BlocBuilder<TeamMembersCubit, TeamMembersState>(
            bloc: _cubit,
            builder: (context, state) {
              if (state is TeamMembersSuccess) {
                return EmployeesOfOutlet(
                    members: state.list, entity: widget.entity);
              }
              if (state is TeamMembersFailure) {
                return Center(
                    child:
                        DataLoadErrorWidget(onPressed: () => fetchTeamMembers));
              }
              return Center(child: AppIndicator());
            },
          ))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class IndividualInfo extends StatelessWidget {
  final Credentials? credentials;
  final EmployeeEntity? employeeEntity;
  const IndividualInfo({super.key, this.credentials, this.employeeEntity})
      : assert(employeeEntity == null || credentials == null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        employeeEntity == null
            ? ImageProfile(
                imageUrl: credentials!.user.pictureUrl == null
                    ? null
                    : credentials!.user.pictureUrl!.toString(),
                size: Size(80, 80),
              )
            : ImageProfile(
                imageUrl: employeeEntity!.user.picture,
                size: Size(80, 80),
              ),
        (credentials != null)
            ? Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Text(credentials!.user.name ?? '',
                    style:
                        context.textTheme.h3?.copyWith(color: AppColors.black)),
              )
            : Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Text(employeeEntity!.user.name!,
                    style:
                        context.textTheme.h3?.copyWith(color: AppColors.black)),
              ),
        // Text('MA0001',
        //     style: context.textTheme.body1?.copyWith(color: AppColors.nobel)),
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
          child: Text(employee.user.name!,
              style: context.textTheme.h3?.copyWith(color: AppColors.black)),
        ),
        // Text('MA0001',
        //     style: context.textTheme.body1?.copyWith(color: AppColors.nobel)),
      ],
    );
  }
}

class OutletInfo extends StatelessWidget {
  final OutletEntity outlet;
  final BoothEntity booth;
  const OutletInfo({super.key, required this.outlet, required this.booth});

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
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            booth.name!,
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
  final GeneralFeatureData entity;
  final List<EmployeeEntity> members;
  const EmployeesOfOutlet(
      {super.key, required this.members, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Text(
            'Danh sách nhân sự làm việc tại booth',
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
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final employee = members[index];
                    return StatisticItem(
                      onPressed: () => context.nextRoute(
                          StatisticModule.employee,
                          arguments: [entity, employee]),
                      title: employee.user.name!,
                      // subTitle: 'Ma00001',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
