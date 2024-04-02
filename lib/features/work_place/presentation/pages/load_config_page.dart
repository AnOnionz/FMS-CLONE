import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/config/presentation/bloc/config_bloc.dart';

import '../../../../core/widgets/app_indicator.dart';
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
            return AppIndicator();
          },
        ),
      ),
    );
  }
}
