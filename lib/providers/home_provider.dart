import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/models/current_model.dart';

class HomeProvider with ChangeNotifier {
  final LocationNotifier _locationNotifier;

  HomeProvider(this._locationNotifier);

  late CurrentModel homeModel;

  Future<void> getCurrentWeather() async {
    String lat = _locationNotifier.lat; // Access lat from LocationNotifier
    String long = _locationNotifier.long; // Access long from LocationNotifier

    Response currentWeather =
        await Dio().get("$baseUrl/$current?Key=$apiKey&q=$lat,$long");

    if (currentWeather.statusCode == 200) {
      var jsonData = currentWeather.data as Map<String, dynamic>;
      homeModel = CurrentModel.fromJson(jsonData);
    }
  }
}
