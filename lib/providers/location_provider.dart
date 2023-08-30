import 'package:geolocator/geolocator.dart';
import 'package:weather_snap/core/app_export.dart';

class LocationProvider extends ChangeNotifier {
  Position? position;

  void permissionChecker() async {
    LocationPermission permission = await Geolocator.requestPermission();
    getCurrentPosition();
  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
