class WeatherBitIoAPI {
  final String domain = 'api.weatherbit.io';
  final String version = 'v2.0';
  final Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/');
  final key = 'GET YOUR OWN API KEY';
}

class APIEndpoints {
  final version = WeatherBitIoAPI().version;
  final currentWeather = '/v2.0/current';
  final dailyForecast = '/v2.0/forecast/daily';
}
