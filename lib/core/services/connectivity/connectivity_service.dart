import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityService {
  late InternetConnection connectivity;
  bool hasConnected = true;

  Stream<InternetStatus> get onConnectionChange => connectivity.onStatusChange;

  ConnectivityService();

  void startup({required Duration interval, required Duration timeout}) {
    connectivity = InternetConnection.createInstance(
      checkInterval: interval,
    );

    connectivity.onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        hasConnected = true;
      } else {
        hasConnected = false;
      }
    });
  }
}
