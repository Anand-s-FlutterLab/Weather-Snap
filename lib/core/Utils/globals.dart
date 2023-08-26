import 'package:flutter/material.dart';

String currentTempUnit = "C";
String currentWindUnit = "KPH";
String currentPressureUnit = "MB";

class LocationNotifier extends ChangeNotifier {
  String _long = "71.68";
  String _lat = "22.7";
  String _cityName = "Wadhwan";

  String get long => _long;

  String get lat => _lat;

  String get cityName => _cityName;

  void updateLocation(String newLong, String newLat, String newCityName) {
    _long = newLong;
    _lat = newLat;
    _cityName = newCityName;

    Future.microtask(() {
      notifyListeners();
    });
  }
}
