import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
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
    Position position = await Geolocator.getCurrentPosition();
    print(position);
  }


  // void getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   print(position);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              getLocation();
            });
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
