import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/services/location/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/core/services/map/map_service.dart';

final class GoogleMapService extends ChangeNotifier implements MapService {
  GoogleMapController? _controller;
  static const _initPosition = LatLng(15.6283721, 106.6830262);
  EdgeInsets _padding = EdgeInsets.zero;

  void set padding(EdgeInsets e) {
    _padding = e;
  }

  CameraPosition _initial = CameraPosition(
    target: myLocation() ?? _initPosition,
    zoom: 16.46,
  );

  static LatLng? myLocation() {
    final _currentPosition = Modular.get<LocationService>().currentLocation;
    if (_currentPosition == null) return null;
    return LatLng(_currentPosition.latitude, _currentPosition.longitude);
  }

  bool isMaploading = true;

  @override
  Widget get mapWidget => GoogleMap(
        initialCameraPosition: _initial,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        padding: _padding,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          isMaploading = false;
          notifyListeners();
          _controller!.animateCamera(CameraUpdate.newCameraPosition(_initial));
        },
      );

  @override
  Future<void> animateCamera(
      {required double lat,
      required double lng,
      double bearing = 0.0,
      double tilt = 0.0,
      double zoom = 18.151926040649414}) async {
    final CameraPosition _position = CameraPosition(
        target: LatLng(lat, lng), bearing: bearing, tilt: tilt, zoom: zoom);
    await _controller?.animateCamera(CameraUpdate.newCameraPosition(_position));
  }
}
