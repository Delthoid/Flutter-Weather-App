// To parse this JSON data, do
//
//     final DailyForecast = DailyForecastFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DailyForecast DailyForecastFromJson(String str) =>
    DailyForecast.fromJson(json.decode(str));

String DailyForecastToJson(DailyForecast data) => json.encode(data.toJson());

class DailyForecast {
  DailyForecast({
    required this.ts,
    // required this.timestampLocal,
    // required this.timestampUtc,
    required this.datetime,
    required this.snow,
    required this.snowDepth,
    required this.precip,
    required this.temp,
    required this.dewpt,
    required this.maxTemp,
    required this.minTemp,
    required this.appMaxTemp,
    required this.appMinTemp,
    required this.rh,
    required this.clouds,
    required this.weather,
    required this.slp,
    required this.pres,
    required this.uv,
    required this.maxDhi,
    required this.vis,
    required this.pop,
    required this.moonPhase,
    required this.sunriseTs,
    required this.sunsetTs,
    required this.moonriseTs,
    required this.moonsetTs,
    required this.pod,
    required this.windSpd,
    required this.windDir,
    required this.windCdir,
    required this.windCdirFull,
  });

  final double ts;
  // final DateTime timestampLocal;
  // final DateTime timestampUtc;
  final String datetime;
  final double snow;
  final double snowDepth;
  final double precip;
  final double temp;
  final double dewpt;
  final double maxTemp;
  final double minTemp;
  final double appMaxTemp;
  final double appMinTemp;
  final int rh;
  final int clouds;
  final Weather weather;
  final double slp;
  final double pres;
  final double uv;
  final String maxDhi;
  final double vis;
  final int pop;
  final double moonPhase;
  final int sunriseTs;
  final int sunsetTs;
  final int moonriseTs;
  final int moonsetTs;
  final String pod;
  final double windSpd;
  final int windDir;
  final String windCdir;
  final String windCdirFull;

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        ts: json["ts"].toDouble(),
        // timestampLocal: DateTime.parse(json["timestamp_local"]),
        // timestampUtc: DateTime.parse(json["timestamp_utc"]),
        datetime: json["datetime"],
        snow: json["snow"].toDouble(),
        snowDepth: json["snow_depth"].toDouble(),
        precip: json["precip"].toDouble(),
        temp: json["temp"].toDouble(),
        dewpt: json["dewpt"].toDouble(),
        maxTemp: json["max_temp"].toDouble(),
        minTemp: json["min_temp"].toDouble(),
        appMaxTemp: json["app_max_temp"].toDouble(),
        appMinTemp: json["app_min_temp"].toDouble(),
        rh: json["rh"],
        clouds: json["clouds"],
        weather: Weather.fromJson(json["weather"]),
        slp: json["slp"].toDouble(),
        pres: json["pres"].toDouble(),
        uv: json["uv"].toDouble(),
        maxDhi: json["max_dhi"] ?? '',
        vis: json["vis"].toDouble(),
        pop: json["pop"],
        moonPhase: json["moon_phase"].toDouble(),
        sunriseTs: json["sunrise_ts"],
        sunsetTs: json["sunset_ts"],
        moonriseTs: json["moonrise_ts"],
        moonsetTs: json["moonset_ts"],
        pod: json["pod"] ?? '',
        windSpd: json["wind_spd"].toDouble(),
        windDir: json["wind_dir"],
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
      );

  Map<String, dynamic> toJson() => {
        "ts": ts,
        // "timestamp_local": timestampLocal.toIso8601String(),
        // "timestamp_utc": timestampUtc.toIso8601String(),
        "datetime": datetime,
        "snow": snow,
        "snow_depth": snowDepth,
        "precip": precip,
        "temp": temp,
        "dewpt": dewpt,
        "max_temp": maxTemp,
        "min_temp": minTemp,
        "app_max_temp": appMaxTemp,
        "app_min_temp": appMinTemp,
        "rh": rh,
        "clouds": clouds,
        "weather": weather.toJson(),
        "slp": slp,
        "pres": pres,
        "uv": uv,
        "max_dhi": maxDhi,
        "vis": vis,
        "pop": pop,
        "moon_phase": moonPhase,
        "sunrise_ts": sunriseTs,
        "sunset_ts": sunsetTs,
        "moonrise_ts": moonriseTs,
        "moonset_ts": moonsetTs,
        "pod": pod,
        "wind_spd": windSpd,
        "wind_dir": windDir,
        "wind_cdir": windCdir,
        "wind_cdir_full": windCdirFull,
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
