import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/providers/search_provider.dart';
import 'package:weather_snap/providers/forecast_provider.dart';

class SearchScreen extends SearchDelegate {
  final BuildContext context;

  SearchScreen(this.context);

  late final searchProvider =
      Provider.of<SearchProvider>(context, listen: false);
  late final locationNotifier =
      Provider.of<LocationNotifier>(context, listen: false);
  late final forecastProvider =
      Provider.of<ForecastProvider>(context, listen: false);

  void handleLocationUpdate(String lon, String lat, String name) {
    locationNotifier.updateLocation(lon, lat, name);
  }

  Map<String, List<double>> topIndianCityNames = {
    'Mumbai': [19.0760, 72.8777],
    'Delhi': [28.6139, 77.2090],
    'Bangalore': [12.9716, 77.5946],
    'Hyderabad': [17.3850, 78.4867],
    'Chennai': [13.0827, 80.2707],
    'Kolkata': [22.5726, 88.3639],
    'Pune': [18.5204, 73.8567],
    'Ahmedabad': [23.0225, 72.5714],
    'Jaipur': [26.9124, 75.7873],
    'Surat': [21.1702, 72.8311],
  };

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.white),
        focusColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white), // <-- that's the one
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 80,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        searchProvider.searchCities(query);
        return searchProvider;
      },
      child: Consumer<SearchProvider>(
        builder: (context, value, child) {
          if (!searchProvider.searchInitialized) {
            return circleLoadingAnimation();
          } else {
            final search = searchProvider.searchResults;
            return Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff000000),
                    Color(0xff130f40),
                  ],
                ),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                shrinkWrap: true,
                itemCount: search.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 1,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      handleLocationUpdate(
                        search[index].lon.toString(),
                        search[index].lat.toString(),
                        search[index].name,
                      );
                      forecastProvider.getForecast();
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.15,
                      width: width * 0.42,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: customText(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.058,
                        text: search[index].name,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff000000),
            Color(0xff130f40),
          ],
        ),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        shrinkWrap: true,
        itemCount: topIndianCityNames.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 1,
          crossAxisSpacing: 25,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              handleLocationUpdate(
                topIndianCityNames.entries.elementAt(index).value[1].toString(),
                topIndianCityNames.entries.elementAt(index).value[0].toString(),
                topIndianCityNames.keys.elementAt(index),
              );
              forecastProvider.getForecast();
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.15,
              width: width * 0.42,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: customText(
                color: Colors.green.shade700,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.058,
                text: topIndianCityNames.keys.elementAt(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
