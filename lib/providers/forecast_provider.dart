import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/models/forecast_model.dart';

class ForecastProvider with ChangeNotifier {
  late ForecastModel forecastModel;
  bool forecastInitialized = false;

  Future<bool> getForecast() async {
    forecastInitialized = false;
    try {
      Response currentWeather =
          await Dio().get("$baseUrl/$forecast?Key=$apiKey&q=$cityName");
      if (currentWeather.statusCode == 200) {
        var jsonData = currentWeather.data as Map<String, dynamic>;
        forecastModel = ForecastModel.fromJson(jsonData);
        forecastInitialized = true;
      } else {
        forecastInitialized = false;
      }
    } catch (e) {
      forecastInitialized = false;
    }
    notifyListeners();
    return forecastInitialized;
  }
}
