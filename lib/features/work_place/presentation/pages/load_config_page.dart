import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/widgets/adaptive_indicator.dart';
import 'package:fms/features/work_place/presentation/bloc/config_bloc.dart';

import '../../domain/entities/work_place_entity.dart';

class LoadConfigPage extends StatelessWidget {
  final WorkPlaceEntity entity;
  LoadConfigPage({super.key, required this.entity});

  late final ConfigBloc bloc = Modular.get()
    ..add(FetchConfig(workPlace: entity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<ConfigBloc, ConfigState>(
          bloc: bloc,
          builder: (context, state) {
            return AdaptiveIndicator();
          },
        ),
      ),
    );
  }
}
