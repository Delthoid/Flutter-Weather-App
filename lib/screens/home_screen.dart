import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:badges/badges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';
import 'package:neu_weather/configs/configs_index.dart';
import 'package:neu_weather/providers/location_provider.dart';
import 'package:neu_weather/providers/today_forecast.dart';
import 'package:neu_weather/screens/screens_index.dart';
import 'package:neu_weather/widgets/custom_app_bar.dart';
import 'package:neu_weather/widgets/today_forecast_card.dart';
import 'package:provider/provider.dart';

import '../routing/router.dart';
import '../theme/theme_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future getCurrentWeather;

  @override
  void initState() {
    final weatherData = Provider.of<TodayForecast>(context, listen: false);
    final locationData = Provider.of<MyLocation>(context, listen: false);

    getLocation(context);

    // getCurrentWeather = weatherData.fetchCurrentWeather(
    //   lat: locationData.lat,
    //   long: locationData.long,
    // );

    //getCurrentWeather;
    super.initState();
  }

  void getLocation(BuildContext context) async {
    final myLocationData = Provider.of<MyLocation>(context, listen: false);
    final forecastData = Provider.of<TodayForecast>(context, listen: false);
    final router = AppRouter(context: context);
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        getCurrentWeather = forecastData.fetchCurrentWeather(
          lat: myLocationData.defaultLat,
          long: myLocationData.defaultLong,
        );
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        getCurrentWeather = forecastData.fetchCurrentWeather(
          lat: myLocationData.defaultLat,
          long: myLocationData.defaultLong,
        );
        return;
      }
    }

    _locationData = await location.getLocation().then((value) {
      myLocationData.setLocation(value);

      getCurrentWeather = forecastData.fetchCurrentWeather(
        lat: myLocationData.lat,
        long: myLocationData.long,
      );

      return value;
    });
    print(_locationData);
  }

  @override
  Widget build(BuildContext context) {
    final forecastData = Provider.of<TodayForecast>(context);
    final locationData = Provider.of<MyLocation>(context);
    final spacing = AppSpacing();
    final decorations = Decorations();
    final screenHeight = MediaQuery.of(context).size.height;

    var cityName = '';

    final Widget svg = SvgPicture.asset(
      'assets/sun_cloudy.svg',
      semanticsLabel: 'Acme Logo',
      fit: BoxFit.cover,
    );

    return Stack(
      children: [
        Container(
          decoration: decorations.gradientDecoration,
        ),
        Container(
          child: Image.asset(
            'assets/background.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          child: Consumer<TodayForecast>(builder: (context, state, _) {
            if (state.currentWeather.data.isNotEmpty) {
              cityName = state.currentWeather.data.first.cityName;
            }

            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: OpenContainer(
                    closedColor: Colors.transparent,
                    openColor: Colors.transparent,
                    openElevation: 0,
                    closedElevation: 0,
                    openShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    transitionDuration: Duration(milliseconds: 500),
                    closedBuilder: (((context, action) => CustomAppBarTitle(
                          titleLeadingSpacing: 18,
                          showChevron: true,
                          leading: const Icon(
                            EvaIcons.pinOutline,
                            color: Colors.white,
                          ),
                          title: Text(
                            cityName,
                            style: textShadowStyle.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Badge(
                              borderSide: const BorderSide(
                                color: lighBlue,
                              ),
                              elevation: 0,
                              position: const BadgePosition(
                                top: 1,
                                end: -2,
                              ),
                              child: const Icon(EvaIcons.bellOutline,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                //expand: true,
                                isScrollControlled: true,
                                isDismissible: true,

                                builder: (context) => BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [Notifications()],
                                  ),
                                ),
                              );
                            },
                          ),
                        ))),
                    openBuilder: ((context, action) => SearchScreen()),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              floatingActionButton: OpenContainer(
                openElevation: 10,
                closedElevation: 20,
                transitionDuration: const Duration(milliseconds: 500),
                openShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                closedBuilder: ((context, action) => IntrinsicHeight(
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          splashColor: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  bottom: 18,
                                  left: 28,
                                  right: 28,
                                ),
                                child: IntrinsicWidth(
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Forecast report',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(EvaIcons.chevronUp),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                openBuilder: (context, action) => const DetailsScreen(),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: spacing.xLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 170,
                          height: 170,
                          child: svg,
                        )
                      ],
                    ),
                    SizedBox(
                      height: spacing.small,
                    ),
                    const TodayForecastCard(),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
