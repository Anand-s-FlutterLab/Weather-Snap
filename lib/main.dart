import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_snap/providers/forecast_provider.dart';
import 'package:weather_snap/providers/home_provider.dart';
import 'package:weather_snap/providers/sidebar_provider.dart';
import 'package:weather_snap/routes/app_routes.dart';
import 'package:weather_snap/screens/home_screen.dart';

void main() {
  runApp(const WeatherSnap());
}

class WeatherSnap extends StatelessWidget {
  const WeatherSnap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<ForecastProvider>(
          create: (context) => ForecastProvider(),
        ),
        ChangeNotifierProvider<SidebarProvider>(
          create: (context) => SidebarProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Express',
        initialRoute: AppRoutes.homeScreen,
        getPages: AppRoutes.pages,
      ),
    );
  }
}
