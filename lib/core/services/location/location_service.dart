import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../permission/permisson_manager.dart';
import './../../../core/constant/keys.dart';
import './../../../core/database/database.dart';
import './../../../core/errors/location_error.dart';

int kDistanceFilter = 0;

final class LocationService extends ChangeNotifier {
  final permissionManager = PermissionManager();

  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;
  // Keep track of current Location
  Position? _currentLocation;

  Database database = Database.instance;

  bool _serviceEnabled = false;

  Position? get currentLocation => _currentLocation;

  void positionUpdate(Position? position) {
    if (position != null) {
      _currentLocation = position;
      notifyListeners();
      database.setValue(Keys.LOCATION, jsonEncode(position.toJson()));
      placemark(position).then((value) {
        database.setValue(Keys.LOCATION_STRING, value);
      });
    }
  }

  static LocationSettings _getLocationSettings() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: kDistanceFilter,
          forceLocationManager: true,
          intervalDuration: 20.seconds,
          timeLimit: 15.seconds,
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "App will continue to receive your location even when you aren't using it",
            notificationTitle: 'Running in Background',
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return AppleSettings(
        pauseLocationUpdatesAutomatically: true,
        timeLimit: 15.seconds,
      );
    } else {
      return LocationSettings(timeLimit: 15.seconds);
    }
  }

  StreamSubscription<Position>? _positionStreamSubscription;

  Stream<Position> get onPositionChanged =>
      Geolocator.getPositionStream(locationSettings: _getLocationSettings());

  Future<bool> _handlePermission(
      [StreamSubscription<Position>? subscription]) async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await _geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      if (subscription == null)
        OverlayManager.showServiceDialog(
            title: 'Vị trí của thiết bị đang tắt',
            message:
                'Ứng dụng yêu cầu vị trí của bạn trong lúc sử dụng ứng dụng',
            solution: () => openLocationSettings());
      subscription?.resume();
      return false;
    }

    permission = await _geolocator
        .checkPermission()
        .timeout(5.seconds, onTimeout: () => LocationPermission.denied);

    if (permission == LocationPermission.denied) {
      try {
        permission = await requestPermission();
        if (permission == LocationPermission.denied) {
          if (subscription == null) subscription?.resume();
          return false;
        }
      } catch (e) {
        if (subscription == null) showNotify();
        subscription?.resume();
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (subscription == null) showNotify();
      subscription?.resume();
      return false;
    }
    subscription?.resume();
    return true;
  }

  Future<LocationPermission> checkPermissions() async {
    final permission = await _geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return Future.error(LocationErrorPermissionDenied());
    }
    return permission;
  }

  Future<bool> checkService() async {
    _serviceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error(LocationErrorServiceDisabled());
    }
    return _serviceEnabled;
  }

  Future<LocationPermission> requestPermission() async {
    final permission = await _geolocator.requestPermission().timeout(15.seconds,
        onTimeout: () => Future.error(LocationErrorPermissionDenied()));

    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      return Future.error(LocationErrorPermissionDenied());
    }

    return permission;
  }

  Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission =
          await _handlePermission().timeout(5.seconds, onTimeout: () => false);

      if (!hasPermission) {
        return currentLocation;
      }

      final userLocation = await _geolocator
          .getCurrentPosition(locationSettings: _getLocationSettings())
          .timeout(5.seconds);

      positionUpdate(userLocation);

      return _currentLocation;
    } catch (e) {
      if (currentLocation != null) {
        return currentLocation;
      } else {
        return Future.error(LocationLoadError());
      }
    }
  }

  Future<Position?> getLastKnowPosition() async {
    try {
      return await _geolocator.getLastKnownPosition();
    } catch (_) {
      return Future.error(LocationLoadError());
    }
  }

  Future<void> openAppSettings() async {
    await _geolocator.openAppSettings();
  }

  Future<void> openLocationSettings() async {
    await _geolocator.openLocationSettings();
  }

  void enablePositionSubscription() {
    if (_positionStreamSubscription == null) {
      _handlePermission().then((value) {
        _positionStreamSubscription =
            onPositionChanged.handleError((error) async {
          _positionStreamSubscription?.pause();
          _handlePermission(_positionStreamSubscription);
        }).listen((Position? position) {
          positionUpdate(position);
          Fx.log(position == null
              ? 'Stream Location: Unknown'
              : 'Stream Location: ${position.latitude.toString()}, ${position.longitude.toString()}');
        });
      });
    }
  }

  void cancelPositionSubscription() {
    _positionStreamSubscription?.cancel();
  }

  Position? getPositionLocal() {
    final _localPosition = database.getValue(Keys.LOCATION);
    if (_localPosition != null) {
      return Position.fromMap(jsonDecode(_localPosition));
    }
    return null;
  }

  Future<String?> placeString() async {
    Position? _position = getPositionLocal();

    if (_position == null) {
      _position =
          await getCurrentPosition().timeout(5.seconds, onTimeout: () => null);
      if (_position == null) {
        return null;
      }
    }
    try {
      final place = await placemark(_position);
      if (place == null) {
        return database.getValue(Keys.LOCATION_STRING);
      }
      return place;
    } catch (e) {
      return database.getValue(Keys.LOCATION_STRING);
    }
  }

  Future<String?> placemark(Position position) async {
    try {
      final placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude)
              .timeout(10.seconds, onTimeout: () => []);
      if (placemarks.isEmpty) {
        return null;
      }
      final Placemark placemark = placemarks.first;

      final street =
          placemark.street?.insert(placemark.street!.isEmpty ? '' : '\n', 0);

      final subLocality = placemark.subLocality
          ?.insert(placemark.subLocality!.isEmpty ? '' : '\n', 0);

      final subAdministrativeArea = placemark.subAdministrativeArea
          ?.insert(placemark.subAdministrativeArea!.isEmpty ? '' : '\n', 0);

      final administrativeArea = placemark.administrativeArea
          ?.insert(placemark.administrativeArea!.isEmpty ? '' : '\n', 0);

      final locationStr =
          '$street$subLocality$subAdministrativeArea$administrativeArea';
      return locationStr;
    } catch (e) {
      return null;
    }
  }

  Future<bool> isValidDistance(
      Position start, Position end, double radius) async {
    final double distance = _geolocator.distanceBetween(
        start.latitude, start.longitude, end.latitude, end.longitude);

    if (distance > radius) {
      return false;
    }
    return true;
  }

  void showNotify() {
    OverlayManager.showServiceDialog(
        title: 'Quyền sử dụng vị trí của thiết bị từ chối',
        message: 'Ứng dụng yêu cầu vị trí của bạn trong lúc sử dụng ứng dụng',
        solution: () => openAppSettings());
  }
}
