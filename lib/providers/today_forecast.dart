import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:neu_weather/configs/api.dart';
import 'package:neu_weather/models/day_forcast.dart';
import 'package:neu_weather/models/weather.dart';

import 'package:http/http.dart' as http;

import '../models/current_weather.dart';

class TodayForecast extends ChangeNotifier {
  WeatherBitIoAPI api = WeatherBitIoAPI();
  APIEndpoints endpoints = APIEndpoints();
  var currentWeather = CurrentWeather(count: 0, data: <Datum>[]);
  var _dailyForecast = <DailyForecast>[];

  var testWeather;

  final int _currentIndex = 2;

  final _todayForecast = <TestWeather>[
    TestWeather(
      weather: WeatherType.sunnyCloudy,
      temparature: 29,
      time: 15,
    ),
    TestWeather(
      weather: WeatherType.rainy,
      temparature: 29,
      time: 15,
    ),
    TestWeather(
      weather: WeatherType.cloudy,
      temparature: 29,
      time: 15,
    ),
    TestWeather(
      weather: WeatherType.stormy,
      temparature: 29,
      time: 15,
    ),
    TestWeather(
      weather: WeatherType.cloudy,
      temparature: 29,
      time: 15,
    ),
  ];

  final _nextForeCast = <DateWeather>[
    DateWeather(
      weather: WeatherType.stormy,
      date: DateTime.now().add(const Duration(days: 1)),
      temperature: 21,
    ),
    DateWeather(
      weather: WeatherType.cloudy,
      date: DateTime.now().add(const Duration(days: 2)),
      temperature: 22,
    ),
    DateWeather(
      weather: WeatherType.sunny,
      date: DateTime.now().add(const Duration(days: 3)),
      temperature: 34,
    ),
    DateWeather(
      weather: WeatherType.cloudy,
      date: DateTime.now().add(const Duration(days: 4)),
      temperature: 27,
    ),
    DateWeather(
      weather: WeatherType.sunnyCloudy,
      date: DateTime.now().add(const Duration(days: 5)),
      temperature: 32,
    ),
    DateWeather(
      weather: WeatherType.sunnyCloudy,
      date: DateTime.now().add(const Duration(days: 6)),
      temperature: 32,
    ),
    DateWeather(
      weather: WeatherType.sunnyCloudy,
      date: DateTime.now().add(const Duration(days: 7)),
      temperature: 32,
    ),
    DateWeather(
      weather: WeatherType.sunnyCloudy,
      date: DateTime.now().add(const Duration(days: 8)),
      temperature: 32,
    ),
    DateWeather(
      weather: WeatherType.sunnyCloudy,
      date: DateTime.now().add(const Duration(days: 9)),
      temperature: 32,
    ),
  ];

  int get currentWeatherIndex {
    return _currentIndex;
  }

  TestWeather get currentTimeWeather {
    return _todayForecast.elementAt(_currentIndex);
  }

  List<TestWeather> get getTodayForecast {
    return _todayForecast;
  }

  List<DateWeather> get nextForeCast {
    return _nextForeCast;
  }

  List<DailyForecast> get dailyForecast {
    return _dailyForecast;
  }

  ///--------API REQUESTRS--------///
  ///

  Future<Response> fetchCurrentWeather({
    required double lat,
    required double long,
  }) async {
    var response = Response('', 401);

    try {
      response = await http.get(Uri.http(
        api.domain,
        endpoints.currentWeather,
        {
          'lat': '$lat',
          'lon': '$long',
          'key': api.key,
        },
      ));

      if (response.statusCode == 200) {
        final data = response.body;
        if (data.isNotEmpty) {
          var info = json.decode(data);
          currentWeather = CurrentWeather.fromJson(jsonDecode(response.body));
          var a = 1;
        }
      }
    } catch (e) {
      print('Exception $e');
    }
    print(' fetch current location ${response.body}');
    var a = response.body;
    notifyListeners();
    return response;
  }

  //16-day/ daily forecast
  Future<Response> fetchDailyForecast({
    required double lat,
    required double long,
  }) async {
    var response = Response('', 401);

    if (dailyForecast.isNotEmpty) {
      response = Response('', 200);
    } else {
      try {
        response = await http.get(Uri.http(
          api.domain,
          endpoints.dailyForecast,
          {
            'lat': '$lat',
            'lon': '$long',
            'days': '16',
            'key': api.key,
          },
        ));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body)["data"];
          data.forEach((json) {
            final _forecast = DailyForecast.fromJson(json);
            if (_dailyForecast.contains(_forecast) == false) {
              _dailyForecast.add(_forecast);
            }
          });
        }
      } catch (e) {
        print('daily forecast exception $e');
      }
    }

    //notifyListeners();
    return response;
  }
}
