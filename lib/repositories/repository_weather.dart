//? utils/generate_weather_data.dart
import "dart:math" as math;
import 'package:weather_app/models/model_city.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/models/model_day.dart';
import 'package:weather_app/models/model_forecast.dart';
import 'package:weather_app/models/model_temperature.dart';

//! generating mock-up(fake) data

class WeatherRepository {
  DateTime _today = DateTime.now().toUtc();
  late DateTime startDateTime;
  late DateTime date;
  var _random = math.Random();
  List<City> cities = allAddedCities;

  WeatherRepository() {
    startDateTime = DateTime.utc(_today.year, _today.month, _today.day, 0);
    date = _today;
  }

  int generateCloudCoverageNum(WeatherDescription description) {
    switch (description) {
      case WeatherDescription.cloudy:
        return 75;
      case WeatherDescription.rain:
        return 45;
      case WeatherDescription.clear:
      case WeatherDescription.sunny:
      default:
        return 5;
    }
  }

  WeatherDescription generateTimeAwareWeatherDescription(DateTime time) {
    final hour = time.hour;
    final isNightTime = (hour < 6 || hour > 18);
    final descriptions = WeatherDescription.values;

    // Used to generate a random weather description
    var description =
        descriptions.elementAt(_random.nextInt(descriptions.length));

    // Used to ensure that it isn't "sunny" at night time, and vice versa.
    if (isNightTime && description == WeatherDescription.sunny) {
      description = WeatherDescription.clear;
    }
    if (!isNightTime && description == WeatherDescription.clear) {
      description = WeatherDescription.sunny;
    }
    return description;
  }

  Day dailyForecastGenerator(City city, int low, int high) {
    List<Weather> forecasts = [];
    int lowestTemp = 555;
    int heighestTemp = -555;

    for (var i = 0; i < 8; i++) {
      startDateTime = startDateTime.add(Duration(hours: 3));
      final temp = _random.nextInt(high);
      WeatherDescription randomDescription =
          generateTimeAwareWeatherDescription(startDateTime);

      final tempBuilder = Temperature(
        current: temp,
        temperatureUnit: TemperatureUnit.celsius,
      );

      forecasts.add(
        Weather(
          city: city,
          dateTime: startDateTime,
          description: randomDescription,
          cloudCoveragePercentage: generateCloudCoverageNum(randomDescription),
          temperature: tempBuilder,
        ),
      );

      lowestTemp = math.min(lowestTemp, temp);
      heighestTemp = math.max(heighestTemp, temp);
    }

    final day = Day(
      weatherPerHours: forecasts,
      lowestTemp: lowestTemp,
      heighestTemp: heighestTemp,
      date: date,
    );
    date.add(Duration(days: 1));
    return day;
  }

  Forecast getTenDayForecast(City city) {
    List<Day> tenDayForecast = [];

    List.generate(10, (int index) {
      tenDayForecast.add(dailyForecastGenerator(city, 2, 10));
    });

    return Forecast(days: tenDayForecast, city: city);
  }
}
