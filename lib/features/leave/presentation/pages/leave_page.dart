import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/leave/domain/entities/leave.dart';
import 'package:fms/features/leave/presentation/widgets/calender_builder.dart';
import 'package:fms/features/leave/presentation/widgets/project_available_box.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/project.dart';
import '../widgets/calender_header.dart';
import '../widgets/leave_form.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  late PageController _pageController;
  late final ValueNotifier<List<Project>> _selectedProjects;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  late final DateTime today = DateTime.now();
  late final DateTime firstDay =
      DateTime(today.year, today.month - 3, today.day);
  late final DateTime lastDay =
      DateTime(today.year, today.month + 3, today.day);

  final data = {
    DateTime.now(): [
      Project(
          name: 'CellphoneS',
          start: '1709604000'.dateTimeFromTimeStamp(),
          end: '1709632800'.dateTimeFromTimeStamp()),
      Project(
          name: 'Strongbow',
          start: '1709629200'.dateTimeFromTimeStamp(),
          end: '1709658000'.dateTimeFromTimeStamp()),
      Project(
          name: 'Blanc',
          start: '1709629200'.dateTimeFromTimeStamp(),
          end: '1709658000'.dateTimeFromTimeStamp()),
    ],
    DateTime.now().add(1.days): [
      Project(
          name: 'CellphoneS',
          start: '1709629200'.dateTimeFromTimeStamp(),
          end: '1709658000'.dateTimeFromTimeStamp()),
      Project(
          name: 'Strongbow',
          start: '1709629200'.dateTimeFromTimeStamp(),
          end: '1709658000'.dateTimeFromTimeStamp()),
      Project(
          name: 'Blanc',
          start: '1709629200'.dateTimeFromTimeStamp(),
          end: '1709658000'.dateTimeFromTimeStamp()),
    ]
  };

  @override
  void initState() {
    super.initState();
    _selectedProjects = ValueNotifier([]);
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedProjects.dispose();
    super.dispose();
  }

  void _createLeaveApplication(Project project) {
    OverlayManager.showSheet(
        body: Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tạo đơn nghỉ phép',
              style: context.textTheme.h2,
            ),
          ),
          SizedBox(height: 26.h),
          LeaveForm(
            date: _focusedDay.value,
            model: Leave(project: project),
          ),
          FlatButton(
              onPressed: () {},
              text: 'Tạo Đơn Nghỉ Phép',
              color: AppColors.orange)
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Xin nghỉ phép',
        action: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 12.h, bottom: 28.h),
              child: Text(
                'Chọn ngày muốn nghỉ phép, sau đó chọn dự án bên dưới để tiến hành tạo đơn nghỉ phép.',
                style: context.textTheme.caption1
                    ?.copyWith(color: AppColors.nobel),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.squared),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.05),
                        offset: Offset(0, 4),
                        blurRadius: 5)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8.w, right: 8.w, bottom: 16.h),
                    child: ValueListenableBuilder<DateTime>(
                      valueListenable: _focusedDay,
                      builder: (context, value, _) {
                        return CalendarHeader(
                          focusedDay: value,
                          onLeftArrowTap: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                          onRightArrowTap: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  CalendarWidget<Project>(
                    firstDay: firstDay,
                    lastDay: lastDay,
                    onCalendarCreated: (controller) =>
                        _pageController = controller,
                    onDaySelected: (projectsSelected) =>
                        _selectedProjects.value = projectsSelected,
                    data: data,
                    focusedDay: _focusedDay,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Container(
                height: 4.h,
                width: 28.w,
                decoration: BoxDecoration(
                    color: '#CED3DE'.toColor(0.5),
                    borderRadius: BorderRadius.circular(4.squared)),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<List<Project>>(
                valueListenable: _selectedProjects,
                builder: (context, projects, _) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Text(DateFormat.EEEE().format(_focusedDay.value)),
                          Container(
                            height: 35.h,
                            width: 35.h,
                            decoration: BoxDecoration(
                                color: '#F7EDE9'.toColor(),
                                borderRadius:
                                    BorderRadius.circular(20.squared)),
                            child: Center(
                              child: Text(
                                _focusedDay.value.day.toString(),
                                style: context.textTheme.h2,
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(
                              parent: ClampingScrollPhysics()),
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return ProjectAvailable(
                              project: projects[index],
                              onPressed: () =>
                                  _createLeaveApplication(projects[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
