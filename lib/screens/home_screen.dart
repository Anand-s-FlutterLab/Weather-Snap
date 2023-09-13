import 'package:get/get.dart';
import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/providers/forecast_provider.dart';
import 'package:weather_snap/providers/initial_provider.dart';
import 'package:weather_snap/providers/location_provider.dart';
import 'package:weather_snap/providers/sidebar_provider.dart';
import 'package:weather_snap/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    final forecastProvider =
        Provider.of<ForecastProvider>(context, listen: false);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) {
          locationProvider.permissionChecker();
          forecastProvider.getForecast();
          return forecastProvider;
        },
        child: Consumer<ForecastProvider>(
          builder: (context, forecastProvider, child) {
            if (!forecastProvider.forecastInitialized) {
              return circleLoadingAnimation();
            } else {
              final forecast = forecastProvider.forecastModel;
              return Container(
                height: height,
                width: width,
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xff000000),
                      Color(0xff130f40),
                    ])),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            customText(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              text: forecast.location.name,
                            ),
                            GestureDetector(
                              onTap: () {
                                showSearch(
                                  context: context,
                                  delegate: SearchScreen(context),
                                );
                              },
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                      (forecast.current.isDay == 1
                                              ? dayImagePath
                                              : nightImagePath) +
                                          forecast.current.condition.icon,
                                    ),
                                    fit: BoxFit.cover,
                                    height: width * 0.25,
                                    width: width * 0.25,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  customText(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    text:
                                        "${forecast.current.feelslikeC.round()} °C",
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: width * 0.35,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: customText(
                                          text: forecast.current.condition.text,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          maxLines: 2),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    rowImageText(
                                      iconPath: pressure,
                                      iconText:
                                          "Pressure: ${forecast.current.pressureIn.round()}",
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: Colors.green,
                                      height: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    rowImageText(
                                      iconPath: humidity,
                                      iconText:
                                          "Humidity: ${forecast.current.humidity}",
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: Colors.green,
                                      height: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    rowImageText(
                                      iconPath: perception,
                                      iconText:
                                          "Precipitation: ${forecast.current.precipIn.round()}",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: customText(
                            text:
                                "Last Updated: ${forecast.current.lastUpdated.substring(11)}",
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                columnImageText(
                                  imagePath: feelsLike,
                                  imageName: "Feels Like",
                                  value: forecast.current.feelslikeC
                                      .round()
                                      .toString(),
                                ),
                                columnImageText(
                                  imagePath: uv,
                                  imageName: "UV",
                                  value: forecast.current.uv.round().toString(),
                                ),
                                columnImageText(
                                  imagePath: visibility,
                                  imageName: "Visibility (KM)",
                                  value:
                                      forecast.current.visKm.round().toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                columnImageText(
                                  height: 70,
                                  width: 70,
                                  imagePath: wind,
                                  imageName: "Wind (kph)",
                                  value: forecast.current.windKph
                                      .round()
                                      .toString(),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                columnImageText(
                                  height: 70,
                                  width: 70,
                                  imagePath: windDirection,
                                  imageName: "Wind Direction",
                                  value: forecast.current.windDir,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              columnImageText(
                                height: 70,
                                width: 70,
                                imageName: "Sunrise",
                                imagePath: sunrise,
                                value: forecast
                                    .forecast.forecastday[0].astro.sunrise,
                              ),
                              columnImageText(
                                height: 70,
                                width: 70,
                                imageName: "Sunset",
                                imagePath: sunset,
                                value: forecast
                                    .forecast.forecastday[0].astro.sunset,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.forecastScreen,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                    color: Colors.white,
                                    text: "Check the Forecast Ahead!",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
      drawer: Consumer<SidebarProvider>(
        builder: (context, sidebarProvider, _) => buildSidebar(
          context,
          sidebarProvider.drawerSelectedIndex,
        ),
      ),
    );
  }
}

Widget rowImageText({
  required String iconPath,
  required String iconText,
  double width = 40,
  double height = 40,
}) {
  return Row(
    children: [
      Image(
        image: AssetImage(iconPath),
        width: width,
        height: height,
        fit: BoxFit.scaleDown,
      ),
      const SizedBox(
        width: 10,
      ),
      customText(
        text: iconText,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ],
  );
}

Widget columnImageText({
  required String imagePath,
  required String imageName,
  required String value,
  double width = 50,
  double height = 50,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(
        image: AssetImage(
          imagePath,
        ),
        width: width,
        height: height,
      ),
      const SizedBox(
        height: 5,
      ),
      customText(
        text: imageName,
        color: Colors.grey,
      ),
      const SizedBox(
        height: 5,
      ),
      customText(text: value, color: Colors.white, fontSize: 25)
    ],
  );
}
