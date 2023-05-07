import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  late Position _currentPosition;

  LocationProvider() {
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission locationPermission =
          await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.always ||
          locationPermission == LocationPermission.whileInUse) {
        _currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Map<String, dynamic> get currentPosition => {
        "latitude": _currentPosition.latitude,
        "longitude": _currentPosition.longitude,
      };
}
