import 'package:geolocator/geolocator.dart';
class Location{
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission.toString());
    if (permission == LocationPermission.denied) {
      print('location off');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('the user denied');
        return;
      }
    }
    try {
      Position position = await Geolocator.getCurrentPosition();
      longitude = position.longitude;
      latitude = position.latitude;
    }
    catch (e) {
      print(e);
    }
  }

}