import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_snap/core/app_export.dart';

Widget circleLoadingAnimation() {
  return SpinKitCircle(
    color: Colors.blue,
    size: width * 0.25,
  );
}

Widget linesLoadingAnimation() {
  return SpinKitSpinningLines(
    color: Colors.blue,
    size: width * 0.25,
    lineWidth: 3,
    itemCount: 6,
  );
}
