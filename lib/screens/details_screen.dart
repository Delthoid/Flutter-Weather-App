import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../configs/configs_index.dart';
import '../helpers/date_formatter.dart';
import '../helpers/regex.dart';
import '../helpers/weather_icon_helper.dart';
import '../models/weather.dart';
import '../providers/location_provider.dart';
import '../providers/today_forecast.dart';
import '../theme/theme_index.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/today_forecast_card.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<Response> fetchDailyForecast;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    final forecastData = Provider.of<TodayForecast>(context, listen: false);
    final locationData = Provider.of<MyLocation>(context, listen: false);

    fetchDailyForecast = forecastData.fetchDailyForecast(
      lat: locationData.lat,
      long: locationData.long,
    );

    super.initState();
  }

  Widget buildTodayForecast() {
    final TodayForecast forecastData = Provider.of<TodayForecast>(
      context,
      listen: false,
    );
    final weatherIconHelper = WeatherIconHelper();

    return SizedBox(
      height: 150,
      //padding: const EdgeInsets.only(left: 32, right: 32),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...forecastData.getTodayForecast.map(
              (e) => buildWeatherCard(e, forecastData.currentTimeWeather == e))
        ],
      ),
    );
  }

  Widget buildNextForecast() {
    final regexHelper = RegexHelper();
    final dateHelper = DateFormatter();

    final TodayForecast forecastData = Provider.of<TodayForecast>(
      context,
      listen: false,
    );
    final weatherIconHelper = WeatherIconHelper();

    return FutureBuilder<Response>(
      future: fetchDailyForecast,
      builder: (context, AsyncSnapshot<Response> snapshot) {
        Widget content = Container();

        if (snapshot.hasData) {
          content = Scrollbar(
            controller: scrollController,
            thickness: 6,
            isAlwaysShown: true,
            interactive: true,
            radius: const Radius.circular(20),
            hoverThickness: 10,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: forecastData.dailyForecast.length,
              itemBuilder: (context, index) {
                var forecast = forecastData.dailyForecast.elementAt(index);
                final DateFormat formatter = DateFormat('MMM, dd');
                final String date = dateHelper
                    .formatDateMMMdd(DateTime.parse(forecast.datetime));

                return SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        date,
                        style: regularText.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        //color: Colors.red,
                        height: 35,
                        width: 35,
                        child: Image(
                            image: weatherIconHelper
                                .fetchWeatherIcon(forecast.weather.icon)),
                      ),
                      Text(
                        '${forecast.temp}°',
                        style: regularText.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          content = const Center(
            child: CircularProgressIndicator(),
          );
        }

        return content;
      },
    );
  }

  Widget buildWeatherCard(TestWeather weather, bool highlight) {
    return TodayForecastCardSmall(
      weather: weather,
      highlighlt: highlight,
    );
  }

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
        Container(
          child: Image.asset(
            'assets/background.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CustomAppBarTitle(
                  titleLeadingSpacing: 0,
                  showChevron: false,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      EvaIcons.chevronLeft,
                      size: 32,
                    ),
                  ),
                  title: Text(
                    'Back',
                    style: textShadowStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(EvaIcons.settingsOutline),
                    onPressed: () {},
                  ),
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          'Today',
                          style: regularText.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Sep, 12',
                        style: regularText,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text(
                                    'Today forecast is not working due to limited API access, hehe sorii puu 🥺🥺'),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          EvaIcons.infoOutline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing.medium,
                ),
                buildTodayForecast(),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Text(
                        'Next Forecast',
                        style: regularText.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const Icon(
                        EvaIcons.calendarOutline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing.medium,
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: buildNextForecast(),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
