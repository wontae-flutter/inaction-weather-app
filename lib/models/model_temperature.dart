//* db에서 올라오는걸 해야하는데, 사실 모델은 아니지 않나...
class Temperature {
  int current;
  TemperatureUnit temperatureUnit;

  static int celsiusToFahrenheit(int temp) => (temp * 9 / 5 + 32).floor();

  Temperature({
    required this.current,
    required this.temperatureUnit,
  });

  static Map<TemperatureUnit, String> temperatureLabels = {
    TemperatureUnit.celsius: "°C",
    TemperatureUnit.fahrenheit: "°F",
  };
}

enum TemperatureUnit { celsius, fahrenheit }
