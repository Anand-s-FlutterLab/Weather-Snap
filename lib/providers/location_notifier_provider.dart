import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_snap/core/constants/constants.dart';
import 'package:weather_snap/models/hive_model.dart';

class LocationNotifier extends ChangeNotifier {
  late String _long;
  late String _lat;

  String get long => _long;

  String get lat => _lat;

  void updateLocation(String newLong, String newLat) {
    _long = newLong;
    _lat = newLat;

    Future.microtask(() {
      notifyListeners();
    });
    updateHiveLocationData();
  }

  void updateHiveLocationData() async {
    final box = await Hive.openBox(hiveBoxName);
    final hiveLocationData = hiveLocationModelToJson(
      HiveLocationModel(lat: _lat, long: _long),
    );
    box.put(hiveBoxLocationKey, hiveLocationData);
  }
}
