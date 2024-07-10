import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/data_load_error_widget.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';
import 'package:fms/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:fms/features/statistic/presentation/widgets/statistic_purchase.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/popup.dart';
import '../widgets/statistic_genaral.dart';
import '../widgets/statistic_gift.dart';
import '../widgets/statistic_sampling.dart';

class StatisticIndividualPage extends StatisticDefaultPage {
  const StatisticIndividualPage({required GeneralFeatureData entity})
      : super(type: StatisticType.individual, entity: entity);
}

class StatisticIndividualOfflinePage extends StatisticDefaultPage {
  const StatisticIndividualOfflinePage({required GeneralFeatureData entity})
      : super(type: StatisticType.individual, entity: entity, isOnline: false);
}

class StatisticOutletPage extends StatisticDefaultPage {
  const StatisticOutletPage({required GeneralFeatureData entity})
      : super(type: StatisticType.outlet, entity: entity);
}

class StatisticEmployeePage extends StatisticDefaultPage {
  final EmployeeEntity employee;
  const StatisticEmployeePage(
      {required GeneralFeatureData entity, required this.employee})
      : super(type: StatisticType.employee, entity: entity);
}

class StatisticDefaultPage extends StatefulWidget {
  final GeneralFeatureData entity;
  final EmployeeEntity? employee;
  final StatisticType type;
  final bool isOnline;
  const StatisticDefaultPage(
      {super.key,
      required this.type,
      required this.entity,
      this.employee,
      this.isOnline = true});

  @override
  State<StatisticDefaultPage> createState() => _StatisticDefaultPageState();
}

class _StatisticDefaultPageState extends State<StatisticDefaultPage>
    with SingleTickerProviderStateMixin, GeneralDataMixin {
  final _bloc = Modular.get<StatisticBloc>();
  late TabController _tabController = TabController(vsync: this, length: 4);

  @override
  void initState() {
    _loadStatistic();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _loadStatistic() {
    if (widget.type == StatisticType.individual)
      _bloc.add(FetchIndividualStatistic(
          featureId: widget.entity.feature.id!, isOnline: widget.isOnline));
    if (widget.type == StatisticType.outlet)
      _bloc.add(FetchTeamStatistic(featureId: widget.entity.feature.id!));
    if (widget.type == StatisticType.employee)
      _bloc.add(FetchEmployeeStatistic(
          featureId: widget.entity.feature.id!,
          employeeId: widget.employee!.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name!),
      body: Padding(
        padding: EdgeInsets.only(
          top: 25.h,
        ),
        child: BlocConsumer<StatisticBloc, StatisticState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is StatisticFailure) {
              if (state.failure is SocketFailure) {
                showInternetFailure();
              } else {
                showFailure(
                    title: 'Tải dữ liệu thất bại',
                    icon: SvgPicture.asset(AppIcons.failure),
                    message: state.failure.message ?? 'Phát sinh lỗi',
                    btnText: 'Thử lại',
                    onPressed: () {
                      _loadStatistic();
                    });
              }
            }
          },
          builder: (context, state) {
            if (state is StatisticSuccess) {
              return Column(
                children: [
                  ColoredBox(
                    color: AppColors.white,
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: AppColors.orange,
                      indicator: UnderlineTabIndicator(
                          borderRadius: BorderRadius.circular(8.sqr),
                          borderSide:
                              BorderSide(color: AppColors.orange, width: 4.h),
                          insets: EdgeInsets.fromLTRB(0, 0, 0, -1.5)),
                      overlayColor:
                          MaterialStatePropertyAll(AppColors.transparent),
                      dividerColor: 'FCD8DF'.toColor(),
                      physics: kPhysics,
                      splashFactory: NoSplash.splashFactory,
                      labelColor: AppColors.orange,
                      unselectedLabelColor: 'CCC6D9'.toColor(),
                      labelStyle: context.textTheme.caption1,
                      tabs: <Widget>[
                        Tab(child: FittedBox(child: Text('Tổng quan'))),
                        Tab(child: FittedBox(child: Text('Sản phẩm'))),
                        Tab(child: FittedBox(child: Text('Quà tặng'))),
                        Tab(child: FittedBox(child: Text('Sampling'))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: kPhysics,
                      children: <Widget>[
                        StatisticGenaral(
                            entity: widget.entity,
                            type: widget.type,
                            statisticEntity: state.statistic,
                            employee: widget.employee,
                            outlet: general!.outlet),
                        StatisticPurchase(
                            total: state.statistic.totalPurchase,
                            purchases: state.statistic.purchases),
                        StatisticGift(
                            total: state.statistic.totalExchange,
                            exchanges: state.statistic.exchanges),
                        StatisticSampling(
                            total: state.statistic.totalSampling,
                            samplings: state.statistic.samplings),
                      ],
                    ),
                  )
                ],
              );
            }
            if (state is StatisticFailure) {
              return Center(
                  child:
                      DataLoadErrorWidget(onPressed: () => _loadStatistic()));
            }
            return Center(child: AppIndicator());
          },
        ),
      ),
    );
  }
}
