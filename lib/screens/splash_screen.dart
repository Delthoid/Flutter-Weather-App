import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:location/location.dart';
import 'package:neu_weather/configs/app.dart';
import 'package:neu_weather/providers/location_provider.dart';
import 'package:neu_weather/providers/today_forecast.dart';
import 'package:neu_weather/routing/router.dart';
import 'package:neu_weather/routing/routes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    final forecastData = Provider.of<TodayForecast>(context, listen: false);

    // SchedulerBinding.instance!.addPostFrameCallback((_) {
    //   getLocation(context);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final forecastData = Provider.of<TodayForecast>(context);
    final myLocationData = Provider.of<MyLocation>(context);

    final theme = Theme.of(context);
    final appConfig = AppConfig();
    final router = AppRouter(context: context);
    final routing = Routing();

    //getLocation(context);

    // if (myLocationData.isCompleted) {
    //   forecastData
    //       .fetchCurrentWeather(
    //     lat: myLocationData.locData.latitude!,
    //     long: myLocationData.locData.latitude!,
    //   )
    //       .then(
    //     (value) {
    //       var a = myLocationData.locData.latitude;
    //       var b = myLocationData.locData.longitude;
    //       if (value.statusCode.toString().contains('20')) {
    //         isLoading = false;
    //         Future.delayed(Duration(seconds: 2)).then((value) {
    //           router.pushNamedAndRemoveUntil('/home');
    //         });
    //       }
    //       return value;
    //     },
    //   );
    // } else {
    //   isLoading = true;
    // }

    Future.delayed((const Duration(seconds: 2)))
        .then((value) => router.pushNamedAndRemoveUntil('/home'));

    return Scaffold(
      body: Container(
        color: theme.primaryColor,
        child: Center(
          child: Column(
            children: [
              Text(appConfig.appName),
              isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
