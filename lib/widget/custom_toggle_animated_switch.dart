import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:weather_snap/core/app_export.dart';

class CustomAnimatedToggleSwitch extends StatelessWidget {
  final Color innerColor;
  final int current;
  final List<int> values;
  final String Function(int) iconBuilder;
  final Color borderColor;
  final Color Function(int) colorBuilder;
  final void Function(int) onChanged;
  final String title;

  const CustomAnimatedToggleSwitch({
    super.key,
    required this.title,
    required this.innerColor,
    required this.current,
    required this.values,
    required this.iconBuilder,
    required this.borderColor,
    required this.colorBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          color: borderColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          text: title,
          textAlign: TextAlign.start,
        ),
        AnimatedToggleSwitch<int>.size(
          innerColor: innerColor,
          current: current,
          values: values,
          iconOpacity: 0.2,
          indicatorSize: const Size.fromWidth(100),
          iconBuilder: (value, size) {
            return Center(
              child: customText(
                text: iconBuilder(value),
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            );
          },
          borderColor: borderColor,
          colorBuilder: colorBuilder,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
