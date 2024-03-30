import 'package:flutter/material.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_sp_page.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_sup_page.dart';

class StatisticPage extends StatelessWidget {
  final bool? isSup;
  const StatisticPage({super.key, this.isSup = false});

  @override
  Widget build(BuildContext context) {
    return switch (isSup) {
      true => StatisticSupPage(),
      _ => StatisticSpPage(),
    };
  }
}
