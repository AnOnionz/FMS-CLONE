import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/empty_widget.dart';
import 'package:fms/features/config/presentation/bloc/config_bloc.dart';
import 'package:fms/features/work_place/domain/entities/booth_entity.dart';
import 'package:fms/features/work_place/presentation/widgets/booth_item.dart';

import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../bloc/fetch_work_place_bloc.dart';
import '../bloc/work_place_bloc.dart';

class BoothSelectionPage extends StatefulWidget {
  BoothSelectionPage({super.key});

  @override
  State<BoothSelectionPage> createState() => _BoothSelectionPageState();
}

class _BoothSelectionPageState extends State<BoothSelectionPage> {
  late final WorkPlaceBloc _workPlaceBloc = Modular.get();

  late final ConfigBloc _configBloc = Modular.get();

  late final FetchWorkPlaceBloc _fetchWorkPlaceBloc =
      Modular.get<FetchWorkPlaceBloc>()
        ..add(FetchBooths(workPlace: _workPlaceBloc.state.entity));

  late StreamSubscription<WorkPlaceState> _workPlaceSubscription;

  @override
  void initState() {
    super.initState();
    _workPlaceSubscription = _workPlaceBloc.stream.listen((event) {
      _configBloc.add(FetchConfig(workPlace: _workPlaceBloc.state.entity));
    });
  }

  @override
  void dispose() {
    _workPlaceSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: 'Chọn Booth'),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách booth',
                  style: context.textTheme.h3,
                ),
                Expanded(
                    child: BlocBuilder<FetchWorkPlaceBloc, FetchWorkPlaceState>(
                  bloc: _fetchWorkPlaceBloc,
                  builder: (context, state) {
                    if (state is FetchWorkPlaceSuccess<BoothEntity>) {
                      return CustomScrollView(
                        physics: kPhysics,
                        slivers: [
                          SliverList.builder(
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              final booth = state.data[index];
                              return Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: BoothItem(
                                  onPressed: () {
                                    _workPlaceBloc.add(ApplyBooth(booth));
                                  },
                                  booth: booth,
                                ),
                              );
                            },
                          )
                        ],
                      );
                    }
                    if (state is FetchWorkPlaceFailure) {
                      return Center(
                        child: DataLoadErrorWidget(
                            onPressed: () => _fetchWorkPlaceBloc.add(
                                FetchBooths(
                                    workPlace: _workPlaceBloc.state.entity))),
                      );
                    }
                    return Center(child: AppIndicator());
                  },
                ))
              ],
            ),
          ),
        ));
  }
}
