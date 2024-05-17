import 'package:flutter/material.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_individual_page.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_team_page.dart';

class StatisticPage extends StatelessWidget {
  final bool? isTeam;
  const StatisticPage({super.key, this.isTeam = false});

  @override
  Widget build(BuildContext context) {
    return switch (isTeam) {
      true => StatisticTeamPage(),
      _ => StatisticIndividualPage(),
    };
  }
}
