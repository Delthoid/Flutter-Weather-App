import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:neu_weather/models/notification.dart';
import 'package:weather_icons/weather_icons.dart';

import '../configs/configs_index.dart';
import '../theme/theme_index.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationModel> newNotifications = <NotificationModel>[
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10m minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
  ];

  List<NotificationModel> earlierNotifications = <NotificationModel>[
    NotificationModel(
      icon: WeatherIcons.windy,
      time: '1 day ago',
      title:
          "A cloudy day will occur all day long, don't worry about the heat of the sun",
    ),
    NotificationModel(
      icon: WeatherIcons.rain_mix,
      time: '2 days ago',
      title:
          "Potential for rain today is 84%, don't forget to bring your umbrella.",
    ),
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10 minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10 minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10 minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10 minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10 minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10 minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
    NotificationModel(
      icon: WeatherIcons.day_sunny,
      time: '10 minutes ago',
      title:
          'A sunny day in your location, consider wearing your UV protection',
    ),
  ];

  Widget notificationTile({
    required NotificationModel notif,
    bool? isGreyed = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onLongPress: () {},
        splashColor: highlightColor,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 31),
          child: Row(
            children: [
              const SizedBox(
                width: 21,
              ),
              Icon(
                notif.icon,
                color: textFocus,
              ),
              const SizedBox(
                width: 21,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notif.time,
                      style: const TextStyle(
                        color: textFocus,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      notif.title,
                      maxLines: 3,
                      style: regularText.copyWith(
                        fontSize: 14,
                        color: isGreyed! ? greyedText : textFocus,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //Spacer(),
              const Icon(EvaIcons.chevronDown),
              const SizedBox(
                width: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationsList() {
    final spacing = AppSpacing();
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Text(
            'New',
            style: regularText.copyWith(
              color: textFocus,
              fontSize: 12,
            ),
          ),
        ),
        ...newNotifications.map((e) => notificationTile(notif: e)),
        SizedBox(
          height: spacing.large,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Text(
            'Earlier',
            style: regularText.copyWith(
              color: greyedText,
              fontSize: 12,
            ),
          ),
        ),
        ...earlierNotifications
            .map((e) => notificationTile(notif: e, isGreyed: true)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final decorations = Decorations();
    final spacing = AppSpacing();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: spacing.medium,
          ),
          Center(
            child: Container(
              height: 2,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0XFF838BAA),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 21, vertical: spacing.large),
            child: Text(
              'Your notification',
              textAlign: TextAlign.start,
              style: regularText.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
          ),
          Container(
            height: 400,
            child: buildNotificationsList(),
          ),
        ],
      ),
    );
  }
}
