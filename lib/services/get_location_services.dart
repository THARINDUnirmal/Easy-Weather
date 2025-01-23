import 'package:geolocator/geolocator.dart';

class GetLocationServices {
  Future<List<double>> getCurruntLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<double> latAndLong = [position.latitude, position.longitude];
    return latAndLong;
  }
}
