import 'dart:async';

import 'package:flutter_kronos/flutter_kronos.dart';
import 'package:fms/core/mixins/extension/num_ext.dart';

final class NetworkTimeService {
  void startup() {
    FlutterKronos.sync();
  }

  Future<DateTime> ntpDateTime() async {
    final result = await FlutterKronos.getNtpDateTime;
    return result ?? DateTime.now();
  }

  Future<DateTime> dateTime() async {
    final result = await FlutterKronos.getDateTime;
    return result ?? DateTime.now();
  }

  Future<int> dateTimeMs() async {
    final result = await FlutterKronos.getCurrentTimeMs;
    return result ?? DateTime.now().millisecondsSinceEpoch;
  }

  Future<int> ntpDateTimeMs() async {
    final result = await FlutterKronos.getCurrentNtpTimeMs;
    return result ?? DateTime.now().millisecondsSinceEpoch;
  }

  Future<({DateTime yesterday, DateTime today})> betweenToday() async {
    final time = await ntpDateTime();
    final today = DateTime(time.year, time.month, time.day, 23, 59, 59, 999);
    final yesterday = today.subtract(1.days);
    return (yesterday: yesterday, today: today);
  }

  ({DateTime yesterday, DateTime today}) betweenTime(DateTime time) {
    final today = DateTime(time.year, time.month, time.day, 23, 59, 59, 999);
    final yesterday = today.subtract(1.days);
    return (yesterday: yesterday, today: today);
  }
}
