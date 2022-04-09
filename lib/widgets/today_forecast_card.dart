import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:neu_weather/configs/spacing.dart';
import 'package:neu_weather/helpers/date_formatter.dart';
import 'package:neu_weather/helpers/regex.dart';
import 'package:neu_weather/helpers/weather_icon_helper.dart';
import 'package:neu_weather/theme/colors.dart';
import 'package:neu_weather/theme/decorations.dart';
import 'package:neu_weather/theme/styles.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

import '../models/weather.dart';
import '../providers/location_provider.dart';
import '../providers/today_forecast.dart';

class TodayForecastCard extends StatefulWidget {
  const TodayForecastCard({Key? key}) : super(key: key);

  @override
  State<TodayForecastCard> createState() => TodayForecastCardState();
}

class TodayForecastCardState extends State<TodayForecastCard> {
  late Future<Response> getCurrentWeather;

  @override
  void initState() {
    final weatherData = Provider.of<TodayForecast>(context, listen: false);
    final locationData = Provider.of<MyLocation>(context, listen: false);

    // getCurrentWeather = weatherData.fetchCurrentWeather(
    //   lat: locationData.locData.latitude ?? locationData.defaultLat,
    //   long: locationData.locData.longitude ?? locationData.defaultLong,
    // );
    super.initState();
  }

  TableRow tableRow(String name, String value) {
    return TableRow(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                          name == 'Wind'
                              ? WeatherIcons.windy
                              : EvaIcons.dropletOutline,
                          size: 17,
                          color: Colors.white),
                    ),
                  ),
                  TextSpan(
                    text: name,
                    //style: regularText,
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              '|',
              style: regularText,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: regularText,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  double msToKmh(double value) {
    return (3.6 * value);
  }

  @override
  Widget build(BuildContext context) {
    final decorations = Decorations();
    final spacing = AppSpacing();
    final regexHelper = RegexHelper();
    final dateHelper = DateFormatter();

    var temp = 0.0;
    var description = '';

    double speed = 0.0;
    int relativeHumidity = 0;

    DateTime date = DateTime.now();

    return Consumer<TodayForecast>(
      builder: (context, state, child) {
        if (state.currentWeather.data.isEmpty) {
          temp = 0;
          description = '';
          //date = DateTime.now();
        } else {
          temp = state.currentWeather.data.first.temp;
          description = state.currentWeather.data.first.weather.description;
          speed = msToKmh(state.currentWeather.data.first.windSpeed);
          relativeHumidity = state.currentWeather.data.first.rh;
        }

        return Padding(
          padding: EdgeInsets.all(spacing.large),
          child: Container(
            // width: double.infinity,
            decoration: decorations.gradientDecorationBW
                .copyWith(borderRadius: BorderRadius.circular(spacing.medium)),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  color: blueCard,
                  borderRadius: BorderRadius.circular(spacing.medium - 2),
                ),
                //width: 100,
                child: Padding(
                  padding: EdgeInsets.all(spacing.small),
                  child: Column(
                    children: [
                      Text(
                        'Today, ${dateHelper.formatDate(date)}',
                        style: regularText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            regexHelper.removeTrailingZero(temp.toString()),
                            style: bigText,
                          ),
                          Text(
                            '°',
                            style: bigText.copyWith(
                              fontSize: 72,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        description,
                        style: regularText,
                      ),
                      SizedBox(
                        height: spacing.xLarge,
                      ),
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(0.5),
                          2: FlexColumnWidth(1)
                        },
                        children: [
                          tableRow('Wind', '${speed.toStringAsFixed(2)} km/h'),
                          TableRow(children: [
                            Container(
                              height: spacing.medium,
                            ),
                            Container(
                              height: spacing.medium,
                            ),
                            Container(
                              height: spacing.medium,
                            ),
                          ]),
                          tableRow('Hum', '$relativeHumidity%'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TodayForecastCardSmall extends StatefulWidget {
  const TodayForecastCardSmall({
    Key? key,
    required this.weather,
    required this.highlighlt,
  }) : super(key: key);

  final TestWeather weather;
  final bool highlighlt;

  @override
  State<TodayForecastCardSmall> createState() => _TodayForecastCardSmallState();
}

class _TodayForecastCardSmallState extends State<TodayForecastCardSmall> {
  @override
  Widget build(BuildContext context) {
    final decorations = Decorations();
    final spacing = AppSpacing();
    final weatherIconHelper = WeatherIconHelper();

    String assetName =
        weatherIconHelper.getSvgPath(weatherType: widget.weather.weather);

    final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo',
      fit: BoxFit.cover,
    );

    return Container(
      // width: double.infinity,
      decoration: widget.highlighlt
          ? decorations.gradientDecorationBW
              .copyWith(borderRadius: BorderRadius.circular(spacing.medium))
          : null,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: widget.highlighlt
              ? BoxDecoration(
                  color: blueCard,
                  borderRadius: BorderRadius.circular(spacing.medium - 1),
                )
              : null,
          //width: 100,
          child: Padding(
            padding: EdgeInsets.all(spacing.small),
            child: Column(
              children: [
                Text(
                  '${widget.weather.temparature}°C',
                  style: regularText,
                ),
                const Spacer(),
                SizedBox(
                  //color: Colors.red,
                  height: 35,
                  width: 35,
                  child: svg,
                ),
                const Spacer(),
                Text(
                  '${widget.weather.time}',
                  style: regularText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
