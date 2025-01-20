import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationServices {
  Future<String> getCurruntLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);

      print(position.latitude);
      print(position.latitude);

      //convert the possition to list of place mark
      List<Placemark> placeMark =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      //extract the city from palace maks
      String cityName = placeMark[0].locality!;
      print(cityName);
      return cityName;
    } catch (error) {
      print(error.toString());
      throw Exception("Error to fetch city nam !");
    }
  }
}
