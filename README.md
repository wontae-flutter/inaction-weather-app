# weather_app

- MediaQuery를 사용하는 경우
앱을 실행하는 단말기의 정보를 얻거나 제어할 때,
1. 현재 휴대폰이 가로방향인지 세로방향인지 확인할 때
2. 접근성과 관련해 애니메이션을 비활성하고 색을 반전시킬 경우
3. 사용자가 텍스트 크기를 확대했는지 확인할 경우
4. 전체 앱에 패딩을 설정할 경우


- 플러터 위젯 속성값 변경을 도와주는 copyWith()
위젯을 커스텀하다보면 변경하고 싶은 값은 1개뿐인데, 필요한(required) 모든 속성값을 입력하지 않았다며 오류를 내뿜는 걸 본 적이 있을 거에요. 특히 themData와 같이 필수 속성값이 여러개인 위젯을 사용할 때 발생합니다.

copyWith()은 위젯의 기존 속성값은 그대로 사용하면서 변경하려는 속성값의 코드만 작성하면 되도록 도와줍니다.

app_settings.dart => model_city.dart & model_temperature.dart(섭씨, 화씨 바꾸는 것)
forecast_animation_utils.dart => model_temperature.dart & model_weather.dart & animation_forecast.dart 

forecast_controller.dart => forecast_provider.dart
utils/humanize.dart => 

- 빌더 패턴
기본 ListView는 모든 자식을 한번에 빌드하고 그린다(CSR과 개념적으로 비슷하다).
ListView.builder는 그 순간 화면에 보이는 항목만 그린다. 수많은 트윗 목록이 있는 트위터를 생각해보면, 어떤 상태가 바뀔 때마다 모든 트윗을 다시 그리는것은 불가능하다. 따라서 사용자가 스크린을 스크롤할 때마다 필요한 항목만 그리는 것이다.

selectedHourlyTemperature = ForecastDay.getWeatherForHour(
      selectedDay,
      DateTime.now().toLocal().hour,
    );
은 repository에 있습니다.

- PreferredSize
자식 위젯에 제약조건을 전달하지 않는 위젯. 주로 앱바에 많이 쓰입니다.