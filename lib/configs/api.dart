class WeatherBitIoAPI {
  final String domain = 'api.weatherbit.io';
  final String version = 'v2.0';
  final key = 'GET YOUR OWN API KEY BRUH';
}

class APIEndpoints {
  final version = WeatherBitIoAPI().version;
  final currentWeather = '/v2.0/current';
  final dailyForecast = '/v2.0/forecast/daily';
}
