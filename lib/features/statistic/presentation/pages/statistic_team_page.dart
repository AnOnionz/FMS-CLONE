import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../bloc/statistic_bloc.dart';
import '../cubit/team_members_cubit.dart';
import '../widgets/statistic_genaral.dart';
import '../widgets/statistic_gift.dart';
import '../widgets/statistic_purchase.dart';
import '../widgets/statistic_sampling.dart';

class StatisticTeamPage extends StatefulWidget {
  final GeneralFeatureData entity;
  const StatisticTeamPage({super.key, required this.entity});

  @override
  State<StatisticTeamPage> createState() => _StatisticTeamPageState();
}

class _StatisticTeamPageState extends State<StatisticTeamPage>
    with SingleTickerProviderStateMixin, GeneralDataMixin {
  final _statisticBloc = Modular.get<StatisticBloc>();

  late TabController _tabController = TabController(vsync: this, length: 4);
  @override
  void initState() {
    _loadStatistic();
    super.initState();
  }

  @override
  void dispose() {
    _statisticBloc.close();
    super.dispose();
  }

  void _loadStatistic() {
    _statisticBloc
        .add(FetchTeamStatistic(featureId: widget.entity.feature.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'title'),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
        ),
        child: BlocBuilder<StatisticBloc, StatisticState>(
          bloc: _statisticBloc,
          builder: (context, state) {
            if (state is StatisticSuccess) {
              return Column(
                children: [
                  TabBar(
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
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: kPhysics,
                      children: <Widget>[
                        StatisticGenaral(
                            entity: widget.entity,
                            type: StatisticType.outlet,
                            statisticEntity: state.statistic,
                            outlet: general.outlet),
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
                  child: DataLoadErrorWidget(onPressed: () => _loadStatistic));
            }
            return Center(child: AppIndicator());
          },
        ),
      ),
    );
  }
}
