import 'package:weather_app/models/model_weather.dart';

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

  static Weather getWeatherAt(int hour, Day day) {
    if (hour == 0) {
      // DateTime hours run 1,2,3...22,23,0
      // 0 == midnight
      return day.weatherPerHours.last;
    }
    return day.weatherPerHours
        .firstWhere((Weather weather) => weather.dateTime.hour >= hour);
  }
}
