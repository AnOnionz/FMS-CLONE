import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../permission/permisson_manager.dart';
import './../../../core/constant/keys.dart';
import './../../../core/database/database.dart';
import './../../../core/errors/location_error.dart';
import './../../../core/mixins/common.dart';

/// singleton service
final class LocationService extends ChangeNotifier {
  LocationService() {
    _currentLocation = getPositionLocal();
  }
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
    }
  }

  static LocationSettings _getLocationSettings() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "App will continue to receive your location even when you aren't using it",
            notificationTitle: 'Running in Background',
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
      );
    } else {
      return LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }
  } // Continuously emit location updates

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
      // show dialog
      subscription?.resume();
      return false;
    }

    permission = await _geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      try {
        permission = await requestPermission();
        if (permission == LocationPermission.denied) {
          OverlayManager.showServiceDialog(
              message: 'Quyền truy cập vị trí ứng dụng đã bị từ chối',
              solution: () => openLocationSettings());
          subscription?.resume();
          return false;
        }
      } catch (e) {
        Fx.log(e);
        subscription?.resume();
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      OverlayManager.showServiceDialog(
        message: 'Quyền truy cập vị trí ứng dụng đã bị từ chối',
        solution: () => openLocationSettings(),
      );
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
    final permission = await _geolocator.requestPermission();

    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      return Future.error(LocationErrorPermissionDenied());
    }

    return permission;
  }

  Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await _handlePermission().timeout(10.seconds);

      if (!hasPermission) {
        return null;
      }

      final userLocation = await _geolocator
          .getCurrentPosition(locationSettings: _getLocationSettings())
          .timeout(10.seconds);

      positionUpdate(userLocation);
      return _currentLocation;
    } catch (e, s) {
      print(e.runtimeType);
      print(s);
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
    _handlePermission().then((value) {
      _positionStreamSubscription =
          onPositionChanged.handleError((error) async {
        Fx.log(error.runtimeType);
        _positionStreamSubscription?.pause();
        _handlePermission(_positionStreamSubscription);
      }).listen((Position? position) {
        positionUpdate(position);
        print(position == null
            ? 'Stream Location: Unknown'
            : 'Stream Location: ${position.latitude.toString()}, ${position.longitude.toString()}');
      });
    });
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

  Future<String> placeString() async {
    final _localPosition = getPositionLocal();
    if (_localPosition == null) {
      return 'Vị trí không xác định';
    } else {
      try {
        final placemarks = await placemarkFromCoordinates(
            _localPosition.latitude, _localPosition.longitude);
        final Placemark place = placemarks.first;
        final locationStr =
            '${place.street}, ${place.subLocality} ${place.subAdministrativeArea}, ${place.administrativeArea}';

        return locationStr;
      } catch (e) {
        return 'Vị trí không xác định';
      }
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
}
