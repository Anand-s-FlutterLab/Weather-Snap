import 'package:get/get.dart';
import 'package:weather_snap/screens/home_screen.dart';

class AppRoutes {
  static String homeScreen = "/home_screen";

  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: const [],
    ),
  ];
}
