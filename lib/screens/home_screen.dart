import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:neu_weather/configs/configs_index.dart';
import 'package:neu_weather/widgets/custom_app_bar.dart';
import 'package:neu_weather/widgets/today_forecast_card.dart';
import 'package:weather_icons/weather_icons.dart';

import '../theme/theme_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing();
    final decorations = Decorations();
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          decoration: decorations.gradientDecoration,
        ),
        Positioned(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CustomAppBarTitle(
                  showChevron: true,
                  leading: const Icon(EvaIcons.pinOutline),
                  title: Text(
                    'Semarang',
                    style: textShadowStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(EvaIcons.bellOutline),
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: spacing.large,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/cloudy_large.png',
                        width: 170,
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: spacing.small,
                  ),
                  const TodayForecastCard(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
