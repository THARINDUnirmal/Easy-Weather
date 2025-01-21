import 'package:geolocator/geolocator.dart';

class GetLocationServices {
  Future<List<double>> getCurruntLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print("latitude : ${position.latitude}");
    print("latitude : ${position.longitude}");

    List<double> latAndLong = [position.latitude, position.longitude];
    print(latAndLong);

    //convert the possition to list of place mark
    // List<Placemark> placeMark =
    //     await placemarkFromCoordinates(position.latitude, position.longitude);

    // //extract the city from palace maks
    // String cityName = placeMark[0].locality!;
    // print("city name : $cityName");
    return latAndLong;
  }
}
