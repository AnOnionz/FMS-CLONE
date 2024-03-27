import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/constant/colors.dart';

class CalendarWidget<T> extends StatefulWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final ValueNotifier<DateTime> focusedDay;
  final void Function(PageController pageController)? onCalendarCreated;
  final void Function(List<T> projectsSelected) onDaySelected;
  final Map<DateTime, List<T>> data;
  CalendarWidget(
      {super.key,
      required this.firstDay,
      required this.lastDay,
      required this.data,
      required this.focusedDay,
      this.onCalendarCreated,
      required this.onDaySelected});

  @override
  State<CalendarWidget<T>> createState() => _CalendarWidgetState<T>();
}

class _CalendarWidgetState<T> extends State<CalendarWidget<T>> {
  DateTime? _selectedDay;
  late final ValueNotifier<List<T>> _selectedProjects;
  late final kEvents = LinkedHashMap<DateTime, List<T>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(widget.data);

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.focusedDay.value;
    _selectedProjects = ValueNotifier(_getProjectsForDay(_selectedDay!));
    widget.onDaySelected(_selectedProjects.value);
  }

  @override
  void dispose() {
    _selectedProjects.dispose();
    super.dispose();
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  List<T> _getProjectsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        widget.focusedDay.value = focusedDay;
      });

      _selectedProjects.value = _getProjectsForDay(selectedDay);
      widget.onDaySelected(_selectedProjects.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<T>(
      firstDay: widget.firstDay,
      lastDay: widget.lastDay,
      focusedDay: widget.focusedDay.value,
      headerVisible: false,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      eventLoader: _getProjectsForDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: _onDaySelected,
      onCalendarCreated: widget.onCalendarCreated,
      onPageChanged: (focusedDay) => widget.focusedDay.value = focusedDay,
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, day, focusedDay) {
          return Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(12.sqr)),
                child: Center(
                    child: Text(
                  day.day.toString(),
                  style: TextStyle(fontSize: 14, color: AppColors.white),
                )),
              ),
            ),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Center(
                child: Text(
              day.day.toString(),
            )),
          );
        },
        markerBuilder: (context, day, events) {
          if (events.isNotEmpty) {
            return SizedBox(
              width: 22.w,
              child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 2.w,
                  runSpacing: 2.h,
                  verticalDirection: VerticalDirection.up,
                  children: events
                      .mapIndexed(
                          (element, index) => _MarkerBuilder(index: index))
                      .toList()),
            );
          }
          return null;
        },
      ),
    );
  }
}

class _MarkerBuilder extends StatelessWidget {
  final int index;
  const _MarkerBuilder({required this.index});

  List<Color> get colors =>
      ['#FF0000'.toColor(), '#FFD600'.toColor(), '#0095FF'.toColor()];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.w,
      width: 4.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.sqr), color: colors[index]),
    );
  }
}
