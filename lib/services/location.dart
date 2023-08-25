import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class Location{
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission.toString());
    if (permission == LocationPermission.denied) {
      print('permission denied 1');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('user denied');
        // Handle the case where the user denied permission
        // You can show a dialog or display an error message
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