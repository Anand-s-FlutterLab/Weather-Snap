import 'package:flutter/material.dart';

class LocationNotifier extends ChangeNotifier {
  String _long = "71.68";
  String _lat = "22.7";

  String get long => _long;

  String get lat => _lat;

  void updateLocation(String newLong, String newLat) {
    _long = newLong;
    _lat = newLat;

    Future.microtask(() {
      notifyListeners();
    });
  }
}
