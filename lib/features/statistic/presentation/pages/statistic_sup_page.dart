import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/statistic/statistic_module.dart';

import '../widgets/statistic_type_item.dart';

class StatisticSupPage extends StatefulWidget {
  const StatisticSupPage({super.key});

  @override
  State<StatisticSupPage> createState() => _StatisticSupPageState();
}

class _StatisticSupPageState extends State<StatisticSupPage> {
  @override
  void dispose() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h, left: 16.w),
              child: Text(
                'Danh sách Outlet',
                style: context.textTheme.h3,
              ),
            ),
            Expanded(
              child: CustomScrollView(
                physics: kPhysics,
                slivers: [
                  SliverList.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => StatisticTypeItem(
                      onPressed: () =>
                          context.nextRoute(StatisticModule.outlet),
                      title: 'Outlet Emart Trường Chinh',
                      subTitle: 'ma0001',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
