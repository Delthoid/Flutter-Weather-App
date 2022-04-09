enum WeatherType { sunny, rainy, stormy, cloudy, sunnyCloudy }
//test model only
class TestWeather {
  final WeatherType weather;
  final double temparature;
  final double time;

  TestWeather(
      {required this.weather, required this.temparature, required this.time});
}

class DateWeather {
  final WeatherType weather;
  final DateTime date;
  final double temperature;

  DateWeather(
      {required this.weather, required this.date, required this.temperature});
}
