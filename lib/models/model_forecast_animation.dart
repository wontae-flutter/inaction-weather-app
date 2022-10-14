import "dart:ui";
import "package:weather_app/models/model_weather.dart";
import "package:weather_app/models/model_day.dart";
import "package:weather_app/models/model_forecast.dart";
import 'package:weather_app/styles.dart';

class ForecastAnimation {
  final Color backgroundColor;
  final Color sunColor;
  final Color textColor;
  final Color cloudColor;
  final double verticalOffsetPosition;
  final double cloudHorizontalOffsetPosition;

  ForecastAnimation({
    required this.backgroundColor,
    required this.sunColor,
    required this.textColor,
    required this.cloudColor,
    required this.verticalOffsetPosition,
    required this.cloudHorizontalOffsetPosition,
  });

  //? 싱글톤 패턴
  //* 생성자가 여러차례 호출되더라도 실제 생성되는 객체는 하나이고, 이후 호출되는 생성자더라도
  //* 최초 생성자가 생성한 객체를 리턴한다
  //! 일반 construct는 항상 새로운 인스턴스를 리턴한다

  // 1. 히나의 클래스에서는 하나의 인스턴스만 생성한다
  // 2. 기존에 이미 생성된 인스턴스가 있다면 return하여 재사용한다
  // 3. 서브 클래스 인스턴스를 리턴할 때 사용할 수 있다
  // 4. Factory constructor에서는 this에 접근할 수 없다

  // 기존에 생성된 인스턴스가 아니라면 새롭게 생성되고, 기존 인스턴스가 있다면 기존 것을 리턴한다

  factory ForecastAnimation.stateForNextSelection(
      int hour, WeatherDescription weatherDescription) {
    hour = (3 * (hour / 3)).round();
    assert(hour % 3 == 0);

    double cloudOffsetPosition =
        (weatherDescription == WeatherDescription.cloudy ||
                weatherDescription == WeatherDescription.rain)
            ? 0.0
            : 1.2;

    switch (hour) {
      case 0:
        return ForecastAnimation(
          backgroundColor: AppColor.midnightSky,
          sunColor: AppColor.midnightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.midnightCloud,
          verticalOffsetPosition: -0.10,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 3:
        return ForecastAnimation(
          backgroundColor: AppColor.twilightSky,
          sunColor: AppColor.twilightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.twilightCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 6:
        return ForecastAnimation(
          backgroundColor: AppColor.dawnSky,
          sunColor: AppColor.dawnSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.dawnCloud,
          verticalOffsetPosition: 0.25,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 9:
        return ForecastAnimation(
          backgroundColor: AppColor.dawnSky,
          sunColor: AppColor.dawnSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.dawnCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 12:
        return ForecastAnimation(
          backgroundColor: AppColor.noonSky,
          sunColor: AppColor.noonSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.noonCloud,
          verticalOffsetPosition: -0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 15:
        return ForecastAnimation(
          backgroundColor: AppColor.noonSky,
          sunColor: AppColor.noonSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.noonCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 18:
        return ForecastAnimation(
          backgroundColor: AppColor.duskSky,
          sunColor: AppColor.duskSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.duskCloud,
          verticalOffsetPosition: 0.5,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 21:
      default:
        return ForecastAnimation(
          backgroundColor: AppColor.nightSky,
          sunColor: AppColor.nightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.nightCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
    }
  }

  static ForecastAnimation getNextForecastAnimation(
    Day day,
    int currentHour,
  ) {
    final newSelection = Day.getWeatherAt(
      currentHour,
      day,
    );

    final endAnimationState = ForecastAnimation.stateForNextSelection(
      newSelection.dateTime.hour,
      newSelection.description,
    );
    return endAnimationState;
  }

  static getCurrentHourFromTabIndex(int index, Day day) {
    return day.weatherPerHours[index].dateTime.hour;
  }
}
