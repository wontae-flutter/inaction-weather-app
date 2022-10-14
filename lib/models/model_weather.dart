import 'package:flutter/material.dart';
import 'package:weather_app/models/model_city.dart';
import 'package:weather_app/models/model_temperature.dart';

class Weather {
  City city;
  DateTime dateTime;
  Temperature temperature;
  WeatherDescription description;
  int cloudCoveragePercentage;
  String? weatherIcon;

  Weather({
    required this.city,
    required this.dateTime,
    required this.temperature,
    required this.description,
    required this.cloudCoveragePercentage,
    this.weatherIcon,
  });

  static Map<WeatherDescription, String> displayValues = {
    WeatherDescription.clear: "Clear",
    WeatherDescription.cloudy: "Cloudy",
    WeatherDescription.rain: "Rain",
    WeatherDescription.sunny: "Sunny",
  };

  static Map<WeatherDescription, IconData> weatherIcons = {
    WeatherDescription.clear: Icons.wb_sunny,
    WeatherDescription.cloudy: Icons.wb_cloudy,
    WeatherDescription.sunny: Icons.brightness_2,
    WeatherDescription.rain: Icons.beach_access
  };
}

enum WeatherDescription { clear, cloudy, sunny, rain }
