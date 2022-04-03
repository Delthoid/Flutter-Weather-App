import 'package:flutter/material.dart';
import 'package:neu_weather/configs/spacing.dart';
import 'package:neu_weather/theme/colors.dart';
import 'package:neu_weather/theme/decorations.dart';
import 'package:neu_weather/theme/styles.dart';

class TodayForecastCard extends StatefulWidget {
  const TodayForecastCard({Key? key}) : super(key: key);

  @override
  State<TodayForecastCard> createState() => TodayForecastCardState();
}

class TodayForecastCardState extends State<TodayForecastCard> {
  @override
  Widget build(BuildContext context) {
    final decorations = Decorations();
    final spacing = AppSpacing();

    return Padding(
      padding: EdgeInsets.all(spacing.medium),
      child: Container(
        width: double.infinity,
        decoration: decorations.gradientDecorationBW
            .copyWith(borderRadius: BorderRadius.circular(spacing.medium)),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              color: blueCard,
              borderRadius: BorderRadius.circular(spacing.medium - 3),
            ),
            width: 100,
            child: Padding(
              padding: EdgeInsets.all(spacing.small),
              child: Column(
                children: [
                  Text(
                    'Today, 12 September',
                    style: regularText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '29',
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
                    'Cloudy',
                    style: regularText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
