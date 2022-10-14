import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/styles.dart';

void main() {
  //* 사용자 설정 저장 기능을 모방하기 위한 클래스
  // AppSettings seetings = AppSettings();

  //* 가로모드 금지
  //* SystemChrome: 네이티브 플랫폼에서 앱이 표시되는 방법을 제어하는 클래스
  // 디바이스를 제어하는데 사용하는 유일한 클래스이다
  // safeArea에서의 배터리 아이콘 색, 시간 바의 색도 바꿀 수 있다
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: "Cabin",
      primaryColor: AppColor.midnightSky,
      highlightColor: AppColor.midnightCloud,
      textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColor.textColorDark,
          displayColor: AppColor.textColorDark),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: Container(),
    );
  }
}
