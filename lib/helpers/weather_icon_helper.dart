import 'package:flutter/material.dart';
import 'package:neu_weather/configs/api.dart';
import 'package:neu_weather/models/weather.dart';

class WeatherIconHelper {
  WeatherBitIoAPI api = WeatherBitIoAPI();

  String getSvgPath({required WeatherType weatherType}) {
    var assetName = '';

    if (weatherType == WeatherType.sunnyCloudy) {
      assetName = 'assets/sun_cloudy.svg';
    } else if (weatherType == WeatherType.cloudy) {
      assetName = 'assets/cloudy.svg';
    } else if (weatherType == WeatherType.rainy) {
      assetName = 'assets/rain.svg';
    } else if (weatherType == WeatherType.sunny) {
      assetName = 'assets/sunny.svg';
    } else if (weatherType == WeatherType.stormy) {
      assetName = 'assets/thunder.svg';
    } else {
      assetName = 'assets/sun_cloudy.svg';
    }

    return assetName;
  }

  ImageProvider fetchWeatherIcon(String icon) {
    var url = 'https://www.weatherbit.io/static/img/icons/$icon.png';
    return Image.network(url).image;
  }
}
