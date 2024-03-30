import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/features/work_place/domain/entities/project_entity.dart';
import 'package:fms/features/work_place/presentation/bloc/work_place_bloc.dart';
import 'package:fms/features/work_place/work_place_module.dart';

import '../../../../core/widgets/app_bar.dart';
import '../bloc/fetch_work_place_bloc.dart';
import '../widgets/project_item.dart';

class ProjectSelectionPage extends StatefulWidget {
  ProjectSelectionPage({super.key});

  @override
  State<ProjectSelectionPage> createState() => _ProjectSelectionPageState();
}

class _ProjectSelectionPageState extends State<ProjectSelectionPage> {
  final FetchWorkPlaceBloc bloc = Modular.get()..add(FetchProjects());

  final WorkPlaceBloc _workPlaceBloc = Modular.get<WorkPlaceBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: 'Chọn dự án'),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách dự án',
                  style: context.textTheme.h3,
                ),
                Expanded(
                  child: BlocBuilder<FetchWorkPlaceBloc, FetchWorkPlaceState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is FetchWorkPlaceSuccess<ProjectEntity>) {
                        return CustomScrollView(
                          physics: kPhysics,
                          slivers: [
                            SliverList.builder(
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                final project = state.data[index];
                                return Padding(
                                  padding: EdgeInsets.only(top: 16.h),
                                  child: ProjectItem(
                                    onPressed: () {
                                      _workPlaceBloc.add(ApplyProject(project));
                                    },
                                    project: project,
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
