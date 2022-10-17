import 'package:flutter/material.dart';
import "package:weather_app/models/model_forecast.dart";
import 'package:weather_app/models/model_temperature.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/models/model_day.dart';
import 'package:weather_app/utils/util_date.dart';

class TableWeekend extends StatelessWidget {
  final Forecast forecast;
  final Tween<Color> textColorTween; //* Tween은 알지?
  final AnimationController? animationController;
  const TableWeekend({
    super.key,
    required this.forecast,
    required this.textColorTween,
    this.animationController,
  });

  int _getFahrenheit (Temperature temperature) {
    if (temperature.temperatureUnit == TemperatureUnit.fahrenheit) {
      return Temperature.celsiusToFahrenheit(temperature.current);
    }

    return temperature.current;
  }

  IconData _getWeatherIcon(Weather weather) {
    return Weather.weatherIcons[weather.description]!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(100.0),
          //* 1번은 일부러 생략된 것, Expanded와 같은 논리이다.
          2: FixedColumnWidth(100.0),
          3: FixedColumnWidth(100.0),
        },
        children: List.generate(7, (index) {
          Day day = forecast.days[index];
          Weather weatherPerHour = day.weatherPerHours[0];
          final weatherIcon = _getWeatherIcon(weatherPerHour);
          return TableRow(
            //! 이 밑부터는 애니메이션의 영역, 조금 기다려!
            children: [
              TableCell(child: Padding(
                padding: ,
              ))
            ]
          )
        }),
      ),
    );
  }
}
