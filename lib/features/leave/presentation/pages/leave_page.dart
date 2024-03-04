import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/leave/presentation/widgets/event_box.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  late PageController _pageController;
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay.value;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  final kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll({
      DateTime.now(): [
        Event('Today\'s Event 1'),
        Event('Today\'s Event 2'),
        Event('Today\'s Event 3'),
      ]
    });

  static int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay.value = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
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
                        return _CalendarHeader(
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
                  TableCalendar<Event>(
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay.value,
                    headerVisible: false,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    calendarFormat: _calendarFormat,
                    rangeSelectionMode: _rangeSelectionMode,
                    eventLoader: _getEventsForDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: _onDaySelected,
                    onCalendarCreated: (controller) =>
                        _pageController = controller,
                    onPageChanged: (focusedDay) =>
                        _focusedDay.value = focusedDay,
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
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
                                  borderRadius:
                                      BorderRadius.circular(12.squared)),
                              child: Center(
                                  child: Text(
                                day.day.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.white),
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
                                    .mapIndexed((element, index) =>
                                        _MarkerBuilder(index: index))
                                    .toList()),
                          );
                        }
                        return null;
                      },
                    ),
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
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
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
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return EventBox();
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

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mText = DateFormat.MMMM().format(focusedDay);
    final yText = focusedDay.year.toString();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onLeftArrowTap,
          child: Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
                border: Border.all(color: '#CED3DE'.toColor()),
                borderRadius: BorderRadius.circular(8.squared)),
            child: Center(child: Icon(Icons.chevron_left)),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              children: [
                Text(
                  mText,
                  style: context.textTheme.subtitle1
                      ?.copyWith(color: '#222B45'.toColor()),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  yText,
                  style: context.textTheme.body1
                      ?.copyWith(color: '#8F9BB3'.toColor()),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onRightArrowTap,
          child: Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
                border: Border.all(color: '#CED3DE'.toColor()),
                borderRadius: BorderRadius.circular(8.squared)),
            child: Center(child: Icon(Icons.chevron_right)),
          ),
        ),
      ],
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
          borderRadius: BorderRadius.circular(4.squared), color: colors[index]),
    );
  }
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
