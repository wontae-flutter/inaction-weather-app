//? model/app_settings.dart
import 'package:weather_app/models/model_country.dart';

List<City> allAddedCities = [
  City(name: "Portland", country: Country.US, active: true, listIdx: 0),
  City(name: "Berlin", country: Country.DE, active: false, listIdx: 1),
  City(name: "Buenos Aires", country: Country.BR, active: false, listIdx: 2),
  City(name: "Chaing Mai", country: Country.TH, active: false, listIdx: 3),
  City(name: "Eugene", country: Country.US, active: false, listIdx: 4),
  City(name: "Georgetown", country: Country.ZA, active: false, listIdx: 5),
  City(name: "London", country: Country.GB, active: false, listIdx: 6),
  City(name: "New York", country: Country.US, active: false, listIdx: 7),
  City(name: "Panama City", country: Country.PA, active: true, listIdx: 8),
  City(name: "San Francisco", country: Country.US, active: false, listIdx: 9),
  City(name: "Tokyo", country: Country.JP, active: false, listIdx: 10),
];
//! activeCity는 그냥 allAddedCities[0]일 뿐

class City {
  late String name;
  late Country country;
  bool active = false;
  bool isDefault = false;
  int? listIdx;

  City({
    required this.name,
    required this.country,
    required this.active,
    this.listIdx,
  }) {
    if (listIdx == null) {
      listIdx = allAddedCities.length + 1;
    }
  }

  //* 아래는 constructor의 종류 중
  City.fromUserInput() {
    if (listIdx == null) {
      listIdx = allAddedCities.length + 1;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          country == other.country &&
          listIdx == other.listIdx;

  @override
  int get hashCode => name.hashCode ^ country.hashCode ^ listIdx.hashCode;
}
