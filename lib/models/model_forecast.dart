import 'package:flutter/material.dart';
import 'package:weather_app/models/model_city.dart';
import 'package:weather_app/models/model_day.dart';
import 'package:weather_app/models/model_weather.dart';

class Forecast {
  City city;
  List<Day> days;

  Forecast({
    required this.city,
    required this.days,
  });

  //? @deprecated getSelectedDayForecast
  static Day getDay(DateTime seletedDate, Forecast forecast) {
    return forecast.days
        .firstWhere((Day day) => day.date.day == seletedDate.day);
  }
}

List<int> hours = [3, 6, 9, 12, 15, 18, 21, 24];
