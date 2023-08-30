import 'package:weather_snap/widget/custom_toggle_animated_switch.dart';
import 'package:weather_snap/core/app_export.dart';
import 'package:weather_snap/providers/setting_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final settingProvider =
        Provider.of<SettingProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              black,
              darkBlue,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ChangeNotifierProvider(
              create: (context) {},
              child: Consumer<SettingProvider>(
                builder: (context, settingProvider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    customText(
                      textAlign: TextAlign.center,
                      text: "Setting",
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    CustomAnimatedToggleSwitch(
                      title: "Pressure",
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.pressureUnit,
                      values: const [0, 1],
                      iconBuilder: (value) => settingProvider.pressure[value],
                      borderColor: Colors.blue.shade300,
                      colorBuilder: (i) => Colors.blue.shade300,
                      onChanged: (i) => settingProvider.changePressureUnit(i),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomAnimatedToggleSwitch(
                      title: "Precipitation",
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.precepUnit,
                      values: const [0, 1],
                      iconBuilder: (value) => settingProvider.precep[value],
                      borderColor: Colors.amber.shade300,
                      colorBuilder: (i) => Colors.amber.shade300,
                      onChanged: (i) => settingProvider.changePrecepUnit(i),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomAnimatedToggleSwitch(
                      title: "Wind",
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.windUnit,
                      values: const [0, 1],
                      iconBuilder: (value) => settingProvider.wind[value],
                      borderColor: Colors.deepOrange.shade300,
                      colorBuilder: (i) => Colors.deepOrange.shade300,
                      onChanged: (i) => settingProvider.changeWindUnit(i),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomAnimatedToggleSwitch(
                      title: "Feels Like",
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.feelsLikeUnit,
                      values: const [0, 1],
                      iconBuilder: (value) => settingProvider.feelsLike[value],
                      borderColor: Colors.pink.shade300,
                      colorBuilder: (i) => Colors.pink.shade300,
                      onChanged: (i) => settingProvider.changeFeelsLikeUnit(i),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomAnimatedToggleSwitch(
                      title: "Visibility",
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.visibilityUnit,
                      values: const [0, 1],
                      iconBuilder: (value) => settingProvider.visibility[value],
                      borderColor: Colors.deepPurple.shade300,
                      colorBuilder: (i) => Colors.deepPurple.shade300,
                      onChanged: (i) => settingProvider.changeVisibilityUnit(i),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomAnimatedToggleSwitch(
                      title: "Temperature",
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.tempUnit,
                      values: const [0, 1],
                      iconBuilder: (value) => settingProvider.temp[value],
                      borderColor: Colors.green.shade300,
                      colorBuilder: (i) => Colors.green.shade300,
                      onChanged: (i) => settingProvider.changeTempUnit(i),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget toggleSwitchTextBuilder({required String text}) {
  return Center(
    child: customText(
      text: text,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}
