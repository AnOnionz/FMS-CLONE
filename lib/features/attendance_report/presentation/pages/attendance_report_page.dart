import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/attendance_report/presentation/bloc/attendance_report_bloc.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/styles/theme.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../../../../core/widgets/popup.dart';
import '../widgets/attendance_detail_item.dart';

class AttendanceReportPage extends StatefulWidget {
  final GeneralFeatureData entity;
  const AttendanceReportPage({super.key, required this.entity});

  @override
  State<AttendanceReportPage> createState() => _AttendanceReportPageState();
}

class _AttendanceReportPageState extends State<AttendanceReportPage> {
  late final outlet = widget.entity.general.outlet;

  final _bloc = Modular.get<AttendanceReportBloc>();

  @override
  void initState() {
    fetchReports();
    super.initState();
  }

  void fetchReports() {
    _bloc.add(FetchAttendanceReports(feature: widget.entity.feature));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name!),
      body: Padding(
        padding: EdgeInsets.only(
          top: 27.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(bottom: 4.h, left: 16.w, right: 16.w),
            //   child: DatePicker(),
            // ),
            Container(
              width: context.screenWidth,
              padding: EdgeInsets.symmetric(vertical: 16.w),
              margin: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 8.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.sqr)),
              child: Column(
                children: [
                  Text(outlet.name ?? '', style: context.textTheme.h3),
                  SizedBox(height: 8.h),
                  Text(
                    outlet.code ?? '',
                    style: context.textTheme.body1
                        ?.copyWith(color: AppColors.nobel),
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<AttendanceReportBloc, AttendanceReportState>(
                bloc: _bloc,
                listener: (context, state) {
                  if (state is AttendanceReportFailure) {
                    showInternetFailure();
                  }
                },
                builder: (context, state) {
                  if (state is AttendanceReportSuccess) {
                    if (state.entities.isEmpty) {
                      return Center(
                          child: Text('Không có dữ liệu',
                              style: context.textTheme.body1));
                    }
                    return CustomScrollView(
                      physics: kPhysics,
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.only(
                            bottom: 14.h,
                          ),
                          sliver: SliverList.builder(
                            itemCount: 7,
                            itemBuilder: (context, index) =>
                                AttendanceDetailItem(),
                          ),
                        )
                      ],
                    );
                  }
                  if (state is AttendanceReportFailure) {
                    return Center(
                        child: DataLoadErrorWidget(
                            onPressed: () => fetchReports()));
                  }
                  return Center(child: AppIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
