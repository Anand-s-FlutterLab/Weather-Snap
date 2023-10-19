import 'dart:convert';

HiveLocationModel hiveLocationModelFromJson(String str) =>
    HiveLocationModel.fromJson(json.decode(str));

String hiveLocationModelToJson(HiveLocationModel data) =>
    json.encode(data.toJson());

HiveSettingModel hiveSettingModelFromJson(String str) =>
    HiveSettingModel.fromJson(json.decode(str));

String hiveSettingModelToJson(HiveSettingModel data) =>
    json.encode(data.toJson());

class HiveLocationModel {
  String lat;
  String long;

  HiveLocationModel({
    required this.lat,
    required this.long,
  });

  factory HiveLocationModel.fromJson(Map<String, dynamic> json) =>
      HiveLocationModel(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class HiveSettingModel {
  int pressure;
  int precep;
  int wind;
  int feelsLike;
  int visibility;
  int temp;

  HiveSettingModel({
    required this.pressure,
    required this.precep,
    required this.wind,
    required this.feelsLike,
    required this.visibility,
    required this.temp,
  });

  factory HiveSettingModel.fromJson(Map<String, dynamic> json) =>
      HiveSettingModel(
        pressure: json["pressure"],
        precep: json["precep"],
        wind: json["wind"],
        feelsLike: json["feelsLike"],
        visibility: json["visibility"],
        temp: json["temp"],
      );

  Map<String, dynamic> toJson() => {
        "pressure": pressure,
        "precep": precep,
        "wind": wind,
        "feelsLike": feelsLike,
        "visibility": visibility,
        "temp": temp,
      };
}
