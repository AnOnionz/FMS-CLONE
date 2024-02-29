sealed class LocationError {
  final String message;

  const LocationError._(
    this.message,
  );

  @override
  String toString() {
    return message;
  }
}

class LocationErrorPermissionDenied extends LocationError {
  const LocationErrorPermissionDenied()
      : super._('Access to the location of the device is denied by the user');
}

class LocationErrorServiceDisabled extends LocationError {
  const LocationErrorServiceDisabled()
      : super._('The location service on the device is disabled');
}

class LocationErrorLoadFailure extends LocationError {
  const LocationErrorLoadFailure() : super._('Something wrong.');
}
