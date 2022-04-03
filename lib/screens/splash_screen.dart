import 'package:flutter/material.dart';
import 'package:neu_weather/configs/app.dart';
import 'package:neu_weather/routing/router.dart';
import 'package:neu_weather/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appConfig = AppConfig();
    final router = AppRouter(context: context);
    final routing = Routing();

    Future.delayed((const Duration(seconds: 2)))
        .then((value) => router.pushNamedAndRemoveUntil('/home'));

    return Scaffold(
      body: Container(
        color: theme.primaryColor,
        child: Center(
          child: Text(appConfig.appName),
        ),
      ),
    );
  }
}
