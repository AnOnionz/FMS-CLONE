import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/statistic/presentation/widgets/statistic_product.dart';

import '../../../../core/constant/enum.dart';
import '../widgets/statistic_genaral.dart';
import '../widgets/statistic_gift.dart';
import '../widgets/statistic_sampling.dart';

class StatisticSpPage extends StatisticDefaultPage {
  const StatisticSpPage() : super(type: StatisticType.sp);
}

class StatisticOutletPage extends StatisticDefaultPage {
  const StatisticOutletPage() : super(type: StatisticType.outlet);
}

class StatisticBoothPage extends StatisticDefaultPage {
  const StatisticBoothPage() : super(type: StatisticType.booth);
}

class StatisticEmployeePage extends StatisticDefaultPage {
  const StatisticEmployeePage() : super(type: StatisticType.employee);
}

class StatisticDefaultPage extends StatefulWidget {
  final StatisticType type;
  const StatisticDefaultPage({super.key, required this.type});

  @override
  State<StatisticDefaultPage> createState() => _StatisticDefaultPageState();
}

class _StatisticDefaultPageState extends State<StatisticDefaultPage>
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
      appBar: DefaultAppBar(title: title),
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
                  borderRadius: BorderRadius.circular(8.sqr),
                  borderSide: BorderSide(color: AppColors.orange, width: 4.h),
                  insets: EdgeInsets.fromLTRB(0, 0, 0, -1.5)),
              overlayColor: MaterialStatePropertyAll(AppColors.transparent),
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
                    type: widget.type,
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

  String get title {
    return switch (widget.type) {
      StatisticType.outlet => 'Thống kê theo outlet',
      StatisticType.booth => 'Thống kê theo booth',
      StatisticType.employee => 'Thống kê theo nhân sự',
      _ => 'Thống kê',
    };
  }
}
