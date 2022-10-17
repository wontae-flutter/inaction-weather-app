import 'package:weather_app/models/model_city.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/models/model_forecast.dart';
import 'package:weather_app/models/model_day.dart';
import "package:weather_app/repositories/repository_weather.dart";

//? forecast_controller
class ForecastProvider {
  City city;
  late Day day;
  late Weather weather;
  late Forecast forecast;
  DateTime now = DateTime.now();
  WeatherRepository weatherRepositry = WeatherRepository();
  late Weather selectedHourWeather;
  //! City를 위한 getter와 setter가 있던데 이게 왜 필요한가?

  ForecastProvider(this.city) {
    forecast = weatherRepositry.getTenDayForecast(city);
    day = Forecast.getDay(
        DateTime(
          now.year,
          now.month,
          now.day,
        ),
        forecast);
    weather = Day.getWeatherAt(DateTime.now().toLocal().hour, day);
    selectedHourWeather = Day.getWeatherAt(DateTime.now().toLocal().hour, day);
  }
  //* 뭐 get, fetch 함수의 내부가 repository로 되는 것이지
}
