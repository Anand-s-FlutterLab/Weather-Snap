import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_snap/providers/forecast_provider.dart';
import 'package:weather_snap/providers/initial_provider.dart';
import 'package:weather_snap/providers/location_provider.dart';
import 'package:weather_snap/providers/search_provider.dart';
import 'package:weather_snap/providers/setting_provider.dart';
import 'package:weather_snap/providers/sidebar_provider.dart';
import 'package:weather_snap/core/app_export.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(hiveBoxName);
  runApp(const WeatherSnap());
}

class WeatherSnap extends StatelessWidget {
  const WeatherSnap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider<LocationNotifier>(
          create: (context) => LocationNotifier(),
        ),
        ChangeNotifierProvider<SettingProvider>(
          create: (context) => SettingProvider(),
        ),
        ChangeNotifierProvider<InitialProvider>(
          create: (context) => InitialProvider(context),
        ),
        ChangeNotifierProxyProvider<LocationNotifier, ForecastProvider>(
          create: (context) => ForecastProvider(
              Provider.of<LocationNotifier>(context, listen: false)),
          update: (context, locationNotifier, forecastProvider) =>
              forecastProvider!
                ..updateLocation(locationNotifier.lat, locationNotifier.long),
        ),
        ChangeNotifierProvider<SidebarProvider>(
          create: (context) => SidebarProvider(),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather Snap',
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.pages,
      ),
    );
  }
}
