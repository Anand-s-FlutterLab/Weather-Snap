import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/providers/forecast_provider.dart';

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
                customText(
                  color: Colors.white,
                  fontSize: 32,
                  text: "Weather Forecast",
                ),
                ListView.separated(
                  padding: const EdgeInsets.all(20),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, parentIndex) {
                    final currentForecast = forecastProvider
                        .forecastModel.forecast.forecastday[parentIndex];
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: customText(
                            color: Colors.white,
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
                          height: 200,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    height: width * 0.15,
                                    width: width * 0.15,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  customText(
                                    text:
                                        "${currentForecast.hour[index].tempC.round()} °C",
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
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
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            itemCount: 12,
                          ),
                        )
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
