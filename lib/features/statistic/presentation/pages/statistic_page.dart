import 'package:flutter/material.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_individual_page.dart';
import 'package:fms/features/statistic/presentation/pages/statistic_team_page.dart';

class StatisticPage extends StatelessWidget {
  final bool? isTeam;
  final GeneralFeatureData entity;
  const StatisticPage({super.key, this.isTeam = false, required this.entity});

  @override
  Widget build(BuildContext context) {
    if (isTeam == true) return StatisticTeamPage(entity: entity);
    return StatisticIndividualPage(entity: entity);
  }
}
