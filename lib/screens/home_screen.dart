import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:neu_weather/widgets/custom_app_bar.dart';
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
              title: const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: CustomAppBarTitle(
                  leading: Icon(EvaIcons.pinOutline),
                  title: Icon(EvaIcons.pinOutline),
                  trailing: Icon(EvaIcons.pinOutline),
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: ElevatedButton(onPressed: () {}, child: const Text('Test')),
          ),
        ),
      ],
    );
  }
}
