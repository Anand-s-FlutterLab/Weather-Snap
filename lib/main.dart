import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_snap/providers/forecast_provider.dart';
import 'package:weather_snap/providers/home_provider.dart';
import 'package:weather_snap/providers/location_provider.dart';
import 'package:weather_snap/providers/search_provider.dart';
import 'package:weather_snap/providers/sidebar_provider.dart';
import 'package:weather_snap/routes/app_routes.dart';
import 'package:weather_snap/screens/home_screen.dart';

import 'core/Utils/globals.dart';

void main() {
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
        ChangeNotifierProvider<HomeProvider>(
          create: (context) {
            // Create LocationNotifier instance here
            LocationNotifier locationNotifier =
                Provider.of<LocationNotifier>(context, listen: false);

            // Pass the locationNotifier to HomeProvider
            return HomeProvider(locationNotifier);
          },
        ),
        ChangeNotifierProxyProvider<LocationNotifier, ForecastProvider>(
          create: (context) => ForecastProvider(
              Provider.of<LocationNotifier>(context, listen: false)),
          update: (context, locationNotifier, forecastProvider) =>
              forecastProvider!
                ..updateLocation(locationNotifier.lat, locationNotifier.long,
                    locationNotifier.cityName),
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
        initialRoute: AppRoutes.homeScreen,
        getPages: AppRoutes.pages,
      ),
    );
  }
}
