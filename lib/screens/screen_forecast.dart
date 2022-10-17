import "package:flutter/material.dart";
import 'package:weather_app/providers/providers_forecast.dart';
import 'package:weather_app/models/model_city.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/animations/animation_forecast.dart';

import 'package:weather_app/widgets/TableWeekend.dart';
import 'package:weather_app/widgets/TimePickerRow.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List<int> hours = [3, 6, 9, 12, 15, 18, 21, 24];
  late int activeTabIndex;
  late ForecastProvider forecastProvider;
  late AnimationController animationController;
  late AnimationController weatherConditionAnimationController;

  //! WTF is a ColorTween?
  ColorTween _colorTween;
  ColorTween _backgroundColorTween;
  ColorTween _textColorTween;
  ColorTween _cloudColorTween;

  //* 요거는 transform.rotate || transition 인거같음
  late Tween<Offset> positionOffsetTween;
  late TweenSequence<Offset> cloudPositionOffsetTween;

  //? State를 표현하고 싶었다면 진짜 이름을 state로 남겨놓는게 좋았을 수도...
  late ForecastAnimation currentAnimationState;
  late ForecastAnimation nextAnimationState;

  @override
  void initState() {
    super.initState();
    //* provider, controller 다 initialize
    //! 패키지 provider는 관련된 것들은 여기에서 할 필요없음, 빌드 메소드에다 하면 됨
    forecastProvider = ForecastProvider(allAddedCities[0]);
    var startTime = forecastProvider.selectedHourWeather.dateTime.hour;
    currentAnimationState = ForecastAnimation.getDataForNextAnimationState(
        forecastProvider.day, startTime);
    activeTabIndex = hours.indexOf(startTime);
    _handleStateChange(activeTabIndex);
  }

  //? 함수가 왜 이렇게 길어?
  //? 여기는 애니메이션이니까... 자세한건 나중에 배우고 gesture만 합시다
  void _handleStateChange(int activeTabIndex) {
    // If choosing the same tab, there's nothing to animate.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appbar에 transitionAppbar라고 뭐 들어감.
        body: GestureDetector);
  }
}
