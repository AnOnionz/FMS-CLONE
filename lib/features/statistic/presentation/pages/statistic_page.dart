import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/statistic/presentation/widgets/statistic_product.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: DefaultAppBar(title: 'Thống kê'),
        body: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: Column(
            children: [
              TabBar(
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
                  physics: RangeMaintainingScrollPhysics(
                      parent: ClampingScrollPhysics()),
                  children: <Widget>[
                    Center(
                      child: Text("It's cloudy here"),
                    ),
                    StatisticProduct(),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
