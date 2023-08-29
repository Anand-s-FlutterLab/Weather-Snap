import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
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
                    AnimatedToggleSwitch<int>.size(
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.pressureUnit,
                      values: const [0, 1],
                      iconOpacity: 0.2,
                      indicatorSize: const Size.fromWidth(100),
                      iconBuilder: (value, size) {
                        return toggleSwitchTextBuilder(
                            text: settingProvider.pressure[value]);
                      },
                      borderColor: Colors.blue.shade300,
                      colorBuilder: (i) => Colors.blue.shade300,
                      onChanged: (i) => settingProvider.changePressureUnit(i),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedToggleSwitch<int>.size(
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.precepUnit,
                      values: const [0, 1],
                      iconOpacity: 0.2,
                      indicatorSize: const Size.fromWidth(100),
                      iconBuilder: (value, size) {
                        return toggleSwitchTextBuilder(
                            text: settingProvider.precep[value]);
                      },
                      borderColor: Colors.amber.shade300,
                      colorBuilder: (i) => Colors.amber.shade300,
                      onChanged: (i) => settingProvider.changePrecepUnit(i),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedToggleSwitch<int>.size(
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.windUnit,
                      values: const [0, 1],
                      iconOpacity: 0.2,
                      indicatorSize: const Size.fromWidth(100),
                      iconBuilder: (value, size) {
                        return toggleSwitchTextBuilder(
                            text: settingProvider.wind[value]);
                      },
                      borderColor: Colors.deepOrange.shade300,
                      colorBuilder: (i) => Colors.deepOrange.shade300,
                      onChanged: (i) => settingProvider.changeWindUnit(i),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedToggleSwitch<int>.size(
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.feelsLikeUnit,
                      values: const [0, 1],
                      iconOpacity: 0.2,
                      indicatorSize: const Size.fromWidth(100),
                      iconBuilder: (value, size) {
                        return toggleSwitchTextBuilder(
                            text: settingProvider.feelsLike[value]);
                      },
                      borderColor: Colors.pink.shade300,
                      colorBuilder: (i) => Colors.pink.shade300,
                      onChanged: (i) => settingProvider.changeFeelsLikeUnit(i),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedToggleSwitch<int>.size(
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.visibilityUnit,
                      values: const [0, 1],
                      iconOpacity: 0.2,
                      indicatorSize: const Size.fromWidth(100),
                      iconBuilder: (value, size) {
                        return toggleSwitchTextBuilder(
                            text: settingProvider.visibility[value]);
                      },
                      borderColor: Colors.deepPurple.shade300,
                      colorBuilder: (i) => Colors.deepPurple.shade300,
                      onChanged: (i) => settingProvider.changeVisibilityUnit(i),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedToggleSwitch<int>.size(
                      innerColor: Colors.grey.shade200,
                      current: settingProvider.tempUnit,
                      values: const [0, 1],
                      iconOpacity: 0.2,
                      indicatorSize: const Size.fromWidth(100),
                      iconBuilder: (value, size) {
                        return toggleSwitchTextBuilder(
                            text: settingProvider.temp[value]);
                      },
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
