import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/statistic/presentation/widgets/statistic_product.dart';

import '../widgets/statistic_gift.dart';
import '../widgets/statistic_sampling.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(vsync: this, length: 4);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Thống kê'),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
        ),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.orange,
              indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(8.squared),
                  borderSide: BorderSide(color: AppColors.orange, width: 4.h),
                  insets: EdgeInsets.fromLTRB(0, 0, 0, -1.5)),
              labelColor: AppColors.orange,
              unselectedLabelColor: 'CCC6D9'.toColor(),
              overlayColor: MaterialStatePropertyAll(AppColors.transparent),
              dividerColor: 'FCD8DF'.toColor(),
              physics: RangeMaintainingScrollPhysics(
                  parent: ClampingScrollPhysics()),
              splashFactory: NoSplash.splashFactory,
              tabs: <Widget>[
                Tab(
                  icon: Text(
                    'Tổng quan',
                    style: context.textTheme.caption1,
                  ),
                ),
                Tab(
                  icon: Text(
                    'Sản phẩm',
                    style: context.textTheme.caption1,
                  ),
                ),
                Tab(
                  icon: Text(
                    'Quà tặng',
                    style: context.textTheme.caption1,
                  ),
                ),
                Tab(
                  icon: Text(
                    'Sampling',
                    style: context.textTheme.caption1,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: RangeMaintainingScrollPhysics(
                    parent: ClampingScrollPhysics()),
                children: <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  StatisticProduct(),
                  StatisticGift(),
                  StatisticSampling(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
