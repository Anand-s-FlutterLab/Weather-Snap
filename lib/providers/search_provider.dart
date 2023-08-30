import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/models/search_model.dart';

class SearchProvider with ChangeNotifier {
  late List<SearchModel> searchResults;
  bool searchInitialized = false;

  Future<bool> searchCities(String query) async {
    searchInitialized = false;
    try {
      Response response =
          await Dio().get("$baseUrl/$search?Key=$apiKey&q=$query");
      if (response.statusCode == 200) {
        var jsonData = response.data as List<dynamic>;
        searchResults = jsonData
            .map((item) => SearchModel.fromJson(item))
            .toList();
        searchInitialized = true;
      } else {
        searchInitialized = false;
      }
    } catch (e) {
      searchInitialized = false;
    }
    notifyListeners();
    return searchInitialized;
  }
}
