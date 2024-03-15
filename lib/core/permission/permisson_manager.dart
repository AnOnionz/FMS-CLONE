import 'dart:io';

import 'package:permission_handler/permission_handler.dart' as ph;

import '/core/mixins/common.dart';

class PermissionManager {
  static PermissionManager? _instance;

  PermissionManager._();

  factory PermissionManager() => _instance ??= PermissionManager._();

  final Set<ph.Permission> _permissions = {};

  Set<ph.Permission> get permissions => _permissions;

  Future<ph.PermissionStatus?> requestPermission(
      ph.Permission permission) async {
    if (canRequestPermisson(permission)) {
      try {
        if (!await permission.isGranted) {
          final status = await permission.request();
          if (status == ph.PermissionStatus.granted) {
            _permissions.add(permission);
          }
          Fx.log('$permission : ${status.name}');
          return status;
        }
      } catch (e) {}
    }

    return null;
  }

  Future<void> openAppSettings() async {
    ph.openAppSettings();
  }

  bool canRequestPermisson(ph.Permission permission) {
    if (Platform.isIOS) {
      return permission != ph.Permission.unknown &&
          permission != ph.Permission.phone &&
          permission != ph.Permission.sms &&
          permission != ph.Permission.ignoreBatteryOptimizations &&
          permission != ph.Permission.accessMediaLocation &&
          permission != ph.Permission.activityRecognition &&
          permission != ph.Permission.manageExternalStorage &&
          permission != ph.Permission.systemAlertWindow &&
          permission != ph.Permission.requestInstallPackages &&
          permission != ph.Permission.accessNotificationPolicy &&
          permission != ph.Permission.bluetoothScan &&
          permission != ph.Permission.bluetoothAdvertise &&
          permission != ph.Permission.bluetoothConnect &&
          permission != ph.Permission.nearbyWifiDevices &&
          permission != ph.Permission.videos &&
          permission != ph.Permission.audio &&
          permission != ph.Permission.scheduleExactAlarm &&
          permission != ph.Permission.sensorsAlways;
    } else {
      return permission != ph.Permission.unknown &&
          permission != ph.Permission.mediaLibrary &&
          permission != ph.Permission.photosAddOnly &&
          permission != ph.Permission.reminders &&
          permission != ph.Permission.bluetooth &&
          permission != ph.Permission.appTrackingTransparency &&
          permission != ph.Permission.criticalAlerts;
    }
  }
}
