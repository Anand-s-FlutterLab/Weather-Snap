import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/models/hive_model.dart';

class SettingProvider extends ChangeNotifier {
  List pressure = ["MB", "IN"];
  List precep = ["MM", "IN"];
  List wind = ["KPH", "MPH"];
  List feelsLike = ["°C", "°F"];
  List visibility = ["KM", "Miles"];
  List temp = ["°C", "°F"];

  int pressureUnit = 0;
  int precepUnit = 0;
  int windUnit = 0;
  int feelsLikeUnit = 0;
  int visibilityUnit = 0;
  int tempUnit = 0;

  void changePressureUnit(int changedPressureUnit) {
    pressureUnit = changedPressureUnit;
    updateHiveSettingData();
    notifyListeners();
  }

  void changePrecepUnit(int changedPrecepUnit) {
    precepUnit = changedPrecepUnit;
    updateHiveSettingData();
    notifyListeners();
  }

  void changeWindUnit(int changedWindUnit) {
    windUnit = changedWindUnit;
    updateHiveSettingData();
    notifyListeners();
  }

  void changeFeelsLikeUnit(int changedFeelsLikeUnit) {
    feelsLikeUnit = changedFeelsLikeUnit;
    updateHiveSettingData();
    notifyListeners();
  }

  void changeVisibilityUnit(int changedVisibilityUnit) {
    visibilityUnit = changedVisibilityUnit;
    updateHiveSettingData();
    notifyListeners();
  }

  void changeTempUnit(int changedTempUnit) {
    tempUnit = changedTempUnit;
    updateHiveSettingData();
    notifyListeners();
  }

  void updateHiveSettingData() async {
    final box = await Hive.openBox(hiveBoxName);
    final hiveSettingData = hiveSettingModelToJson(
      HiveSettingModel(
        pressure: pressureUnit,
        precep: precepUnit,
        wind: windUnit,
        feelsLike: feelsLikeUnit,
        visibility: visibilityUnit,
        temp: tempUnit,
      ),
    );
    print(hiveSettingData);
    box.put(hiveBoxSettingKey, hiveSettingData);
  }
}
