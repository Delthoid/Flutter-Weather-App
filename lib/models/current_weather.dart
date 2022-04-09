import 'dart:convert';

CurrentWeather currentWeatherFromJson(String str) =>
    CurrentWeather.fromJson(json.decode(str));

String currentWeatherToJson(CurrentWeather data) => json.encode(data.toJson());

class CurrentWeather {
  CurrentWeather({
    required this.count,
    required this.data,
  });

  final int count;
  final List<Datum> data;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.cityName,
    required this.stateCode,
    required this.countryCode,
    required this.timezone,
    required this.lat,
    required this.lon,
    required this.station,
    required this.vis,
    required this.rh,
    required this.dewpt,
    required this.windDir,
    required this.windCdir,
    required this.windCdirFull,
    required this.windSpeed,
    required this.temp,
    required this.appTemp,
    required this.clouds,
    required this.weather,
    required this.datetime,
    required this.obTime,
    required this.ts,
    required this.sunrise,
    required this.sunset,
    required this.slp,
    required this.pres,
    required this.aqi,
    required this.uv,
    required this.solarRad,
    required this.ghi,
    required this.dni,
    required this.dhi,
    required this.elevAngle,
    this.hourAngle = 0.0,
    required this.pod,
    required this.precip,
    required this.snow,
  });

  final String cityName;
  final String stateCode;
  final String countryCode;
  final String timezone;
  final double lat;
  final double lon;
  final String station;
  final int vis;
  final dynamic rh;
  final dynamic dewpt;
  final int windDir;
  final String windCdir;
  final String windCdirFull;
  final dynamic windSpeed;
  final double temp;
  final double appTemp;
  final int clouds;
  final Weather weather;
  final String datetime;
  final String obTime;
  final double ts;
  final String sunrise;
  final String sunset;
  final double slp;
  final double pres;
  final double aqi;
  final double uv;
  final double solarRad;
  final double ghi;
  final double dni;
  final double dhi;
  final double elevAngle;
  double? hourAngle;
  final String pod;
  final double precip;
  final double snow;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cityName: json["city_name"],
        stateCode: json["state_code"],
        countryCode: json["country_code"],
        timezone: json["timezone"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        station: json["station"],
        vis: json["vis"],
        rh: json["rh"],
        dewpt: json["dewpt"],
        windDir: json["wind_dir"],
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windSpeed: json["wind_spd"],
        temp: json["temp"].toDouble(),
        appTemp: json["app_temp"].toDouble(),
        clouds: json["clouds"],
        weather: Weather.fromJson(json["weather"]),
        datetime: json["datetime"],
        obTime: json["ob_time"],
        ts: json["ts"].toDouble(),
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        slp: json["slp"].toDouble(),
        pres: json["pres"].toDouble(),
        aqi: json["aqi"].toDouble(),
        uv: json["uv"].toDouble(),
        solarRad: json["solar_rad"].toDouble(),
        ghi: json["ghi"].toDouble(),
        dni: json["dni"].toDouble(),
        dhi: json["dhi"].toDouble(),
        elevAngle: json["elev_angle"].toDouble(),
        hourAngle: json["hour_angle"],
        pod: json["pod"],
        precip: json["precip"].toDouble(),
        snow: json["snow"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "city_name": cityName,
        "state_code": stateCode,
        "country_code": countryCode,
        "timezone": timezone,
        "lat": lat,
        "lon": lon,
        "station": station,
        "vis": vis,
        "rh": rh,
        "dewpt": dewpt,
        "wind_dir": windDir,
        "wind_cdir": windCdir,
        "wind_cdir_full": windCdirFull,
        "wind_spd": windSpeed,
        "temp": temp,
        "app_temp": appTemp,
        "clouds": clouds,
        "weather": weather.toJson(),
        "datetime": datetime,
        "ob_time": obTime,
        "ts": ts,
        "sunrise": sunrise,
        "sunset": sunset,
        "slp": slp,
        "pres": pres,
        "aqi": aqi,
        "uv": uv,
        "solar_rad": solarRad,
        "ghi": ghi,
        "dni": dni,
        "dhi": dhi,
        "elev_angle": elevAngle,
        "hour_angle": hourAngle,
        "pod": pod,
        "precip": precip,
        "snow": snow,
      };
}

class Weather {
  Weather({
    required this.icon,
    required this.code,
    required this.description,
  });

  final String icon;
  final int code;
  final String description;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "code": code,
        "description": description,
      };
}
