import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:neu_weather/providers/location_provider.dart';
import 'package:neu_weather/providers/today_forecast.dart';
import 'package:neu_weather/routing/routes.dart';
import 'package:provider/provider.dart';
import '../screens/screens_index.dart';
import 'theme/theme_index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeConfig>(create: (_) => AppThemeConfig()),
        ChangeNotifierProvider<TodayForecast>(create: (_) => TodayForecast()),
        ChangeNotifierProvider<MyLocation>(create: (_) => MyLocation()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void getLocation(BuildContext context) async {
    final myLocationData = Provider.of<MyLocation>(context, listen: false);
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation().then((value) {
      myLocationData.setLocation(value);
      return value;
    });
    print(_locationData);
  }

  @override
  Widget build(BuildContext context) {
    final appThemeData = Provider.of<AppThemeConfig>(context);
    Routing routing = Routing();

    //getLocation(context);

    return MaterialApp(
      title: 'Weather Flutter',
      theme: appThemeData.currentAppTheme,
      initialRoute: '/',
      routes: routing.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
