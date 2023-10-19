import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/models/hive_model.dart';
import 'package:weather_snap/providers/setting_provider.dart';

class InitialProvider with ChangeNotifier {
  final BuildContext context;

  InitialProvider(this.context);

  void getStorageData() async {
    final box = await Hive.openBox(hiveBoxName);

    try {
      final localSettingData =
          HiveSettingModel.fromJson(jsonDecode(box.get(hiveBoxSettingKey)));
      setSettingData(localSettingData);
    } catch (e) {
      print(e);
    }

    try {
      final localLocationData =
          HiveLocationModel.fromJson(jsonDecode(box.get(hiveBoxLocationKey)));
      settingLocationData(localLocationData);
    } catch (e) {
      print(e);
    }
  }

  void setSettingData(HiveSettingModel settingModel) {
    final settingProvider =
        Provider.of<SettingProvider>(context, listen: false);

    settingProvider.changeFeelsLikeUnit(settingModel.feelsLike);
    settingProvider.changePrecepUnit(settingModel.precep);
    settingProvider.changePressureUnit(settingModel.pressure);
    settingProvider.changeTempUnit(settingModel.temp);
    settingProvider.changeVisibilityUnit(settingModel.visibility);
    settingProvider.changeWindUnit(settingModel.wind);
  }

  void settingLocationData(HiveLocationModel locationModel) {
    final locationNotifier =
        Provider.of<LocationNotifier>(context, listen: false);

    locationNotifier.updateLocation(
      locationModel.long,
      locationModel.lat,
    );
    print(locationModel.lat);
    print(locationModel.long);
    print(locationNotifier.lat);
    print(locationNotifier.long);
  }
}
