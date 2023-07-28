import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/models/current_model.dart';

class HomeProvider with ChangeNotifier {
  late CurrentModel homeModel;
  Future<void> getCurrentWeather() async {
    Response currentWeather =
        await Dio().get("$baseUrl/$current?Key=$apiKey&q=$cityName");
    if (currentWeather.statusCode == 200) {
      var jsonData = currentWeather.data as Map<String, dynamic>;
      homeModel = CurrentModel.fromJson(jsonData);
    }
  }
}
