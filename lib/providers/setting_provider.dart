import 'package:weather_snap/core/app_export.dart';

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
    notifyListeners();
  }

  void changePrecepUnit(int changedPrecepUnit) {
    precepUnit = changedPrecepUnit;
    notifyListeners();
  }

  void changeWindUnit(int changedWindUnit) {
    windUnit = changedWindUnit;
    notifyListeners();
  }

  void changeFeelsLikeUnit(int changedFeelsLikeUnit) {
    feelsLikeUnit = changedFeelsLikeUnit;
    notifyListeners();
  }

  void changeVisibilityUnit(int changedVisibilityUnit) {
    visibilityUnit = changedVisibilityUnit;
    notifyListeners();
  }

  void changeTempUnit(int changedTempUnit) {
    tempUnit = changedTempUnit;
    notifyListeners();
  }
}
