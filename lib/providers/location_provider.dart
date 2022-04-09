import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class MyLocation extends ChangeNotifier {
  var lat = 0.0;
  var long = 0.0;
  bool isCompleted = false;

  //Manila
  double defaultLat = 14.5865;
  double defaultLong = 121.1149;

  void setLocation(LocationData data) {
    // _locationData = data;
    lat = data.latitude!;
    long = data.longitude!;
    isCompleted = true;
    notifyListeners();
  }

  List<double> get coordinates {
    return [lat, long];
  }
}
