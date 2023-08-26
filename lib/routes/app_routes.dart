import 'package:get/get.dart';
import 'package:weather_snap/screens/home_screen.dart';
import 'package:weather_snap/screens/info_screen.dart';

class AppRoutes {
  static String homeScreen = "/home_screen";
  static String infoScreen = "/info_screen";

  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: const [],
    ),
    GetPage(
      name: infoScreen,
      page: () => const InfoScreen(),
      bindings: const [],
    ),
  ];
}
