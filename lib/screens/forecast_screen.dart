import 'package:get/get.dart';
import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/providers/forecast_provider.dart';
import 'package:weather_snap/screens/search_screen.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forecastProvider =
        Provider.of<ForecastProvider>(context, listen: false);
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      customText(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        text: "Weather Forecast",
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
                ),
                ListView.separated(
                  padding: const EdgeInsets.all(20),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, parentIndex) {
                    final currentForecast = forecastProvider
                        .forecastModel.forecast.forecastday[parentIndex];
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: customText(
                            color: Colors.green.shade300,
                            fontSize: 32,
                            text: currentForecast.date
                                .toString()
                                .substring(0, 10),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 260,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              height: height * 0.25,
                              width: width * 0.28,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        (currentForecast.hour[index].isDay == 1
                                                ? dayImagePath
                                                : nightImagePath) +
                                            currentForecast
                                                .hour[index].condition.icon,
                                      ),
                                      fit: BoxFit.cover,
                                      height: width * 0.1632,
                                      width: width * 0.1632,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(feelsLike),
                                          height: width * 0.055,
                                          width: width * 0.055,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        customText(
                                          text:
                                              "${currentForecast.hour[index].tempC.round()} °C",
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    buildLine(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(visibility),
                                          height: width * 0.055,
                                          width: width * 0.055,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        customText(
                                          text:
                                              "${currentForecast.hour[index].visKm.round()} KM",
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    buildLine(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(perception),
                                          height: width * 0.055,
                                          width: width * 0.055,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        customText(
                                          text:
                                              "${currentForecast.hour[index].precipIn.round()} in",
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    buildLine(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(wind),
                                          height: width * 0.055,
                                          width: width * 0.055,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        customText(
                                          text:
                                              "${currentForecast.hour[index].windKph.round()} KPH",
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    buildLine(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(windDirection),
                                          height: width * 0.055,
                                          width: width * 0.055,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        customText(
                                          text: currentForecast
                                              .hour[index].windDir,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    buildLine(),
                                    customText(
                                      text: currentForecast.hour[index].time
                                          .toString()
                                          .substring(11, 16),
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            itemCount: currentForecast.hour.length,
                          ),
                        ),
                        const SizedBox(height: 20,),
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
                                value: currentForecast.astro.sunrise,
                              ),
                              columnImageText(
                                height: 70,
                                width: 70,
                                imageName: "Sunset",
                                imagePath: sunset,
                                value: currentForecast.astro.sunset,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: forecastProvider
                      .forecastModel.forecast.forecastday.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildLine() {
  return Column(
    children: [
      const SizedBox(
        height: 5,
      ),
      Container(
        height: 1,
        width: double.infinity,
        color: Colors.green,
      ),
      const SizedBox(
        height: 5,
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
