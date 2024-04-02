import 'dart:async';

import 'package:flutter_kronos/flutter_kronos.dart';

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
}
