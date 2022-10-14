import 'package:flutter/material.dart';
import 'package:weather_app/models/model_city.dart';

class Forecast {
  City city;
  List<Day> days;

  Forecast({
    required this.city,
    required this.days,
  });

  static Day getForecast(Forecast forecast, DateTime seletedDate) {
    return forecast.days
        .firstWhere((Day day) => day.date.day == seletedDate.day);
  }
}

class Day {
  List<Weather> weatherPerHours;
  DateTime date;
  int lowestTemp;
  int heighestTemp;

  Day({
    required this.weatherPerHours,
    required this.date,
    required this.lowestTemp,
    required this.heighestTemp,
  });

  static Weather getWeatherAt(Day day, int hour) {
    if (hour == 0) {
      // DateTime hours run 1,2,3...22,23,0
      // 0 == midnight
      return day.weatherPerHours.last;
    }
    return day.weatherPerHours
        .firstWhere((Weather weather) => weather.dateTime.hour >= hour);
  }
}

class Weather {
  City city;
  DateTime dateTime;
  Temperature temperature;
  WeatherDescription description;
  int cloudCoveragePercentage;
  String weatherIcon;

  Weather({
    required this.city,
    required this.dateTime,
    required this.temperature,
    required this.description,
    required this.cloudCoveragePercentage,
    required this.weatherIcon,
  });

  static Map<WeatherDescription, String> displayValues = {
    WeatherDescription.clear: "Clear",
    WeatherDescription.cloudy: "Cloudy",
    WeatherDescription.rain: "Rain",
    WeatherDescription.sunny: "Sunny",
  };
}

class Temperature {
  int current;
  TemperatureUnit temperatureUnit;

  static int celsiusToFahrenheit(int temp) => (temp * 9 / 5 + 32).floor();

  Temperature({
    required this.current,
    required this.temperatureUnit,
  });
}

List<int> hours = [3, 6, 9, 12, 15, 18, 21, 24];

enum TemperatureUnit { celsius, fahrenheit }

Map<TemperatureUnit, String> temperatureLabels = {
  TemperatureUnit.celsius: "°C",
  TemperatureUnit.fahrenheit: "°F",
};

enum WeatherDescription { clear, cloudy, sunny, rain }

Map<WeatherDescription, IconData> weatherIcons = {
  WeatherDescription.clear: Icons.wb_sunny,
  WeatherDescription.cloudy: Icons.wb_cloudy,
  WeatherDescription.sunny: Icons.brightness_2,
  WeatherDescription.rain: Icons.beach_access
};
