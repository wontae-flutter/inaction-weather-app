import 'package:flutter/material.dart';
import "package:weather_app/screens/screen_all.dart";
import "package:weather_app/models/model_city.dart";
import "package:weather_app/models/model_weather.dart";
import "package:weather_app/models/model_temperature.dart";
import 'package:weather_app/styles.dart';

class SettingScreens extends StatefulWidget {
  const SettingScreens({super.key});

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  //* 이거 따로 만들어야하나 진짜...
  List<String> get temperatureOptions => TemperatureUnit.values
      .map((value) => value.toString().split(".")[1])
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings Page",
          style: TextStyle(color: AppColor.textColorLight),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Text('Temperature Unit'),
          // SegmentedControl()
          const Divider(),
          //* 맨앞에 하나 먼저!, 리스트뷰로 만들지 않는 아이
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Add new city"),
            onTap: () {
              //? 팝업이 아니라 새로운 페이지로 아예 넘겨버리네?
              Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return AddNewCityScreen();
                  }));
            },
          ),
          const Divider(),
          Expanded(
              child: ListView.builder(
                  itemCount: allAddedCities.length,
                  itemBuilder: (BuildContext context, int index) {
                    final city = allAddedCities[index];
                    //!* 요게바로 양옆으로 스크롤했을 떄 사라지게 하는 마법의 위젯
                    return Dismissible(
                      key: ValueKey(city),
                      onDismissed: (DismissDirection dismissDirection) {
                        if (dismissDirection == DismissDirection.endToStart) {
                          allAddedCities
                              .removeWhere((targetCity) => targetCity == city);
                          if (allAddedCities[0] == city) {
                            allAddedCities[0] = allAddedCities
                                .firstWhere((city) => city.active);
                          }
                        }
                      },
                      child: CheckboxListTile(
                        onChanged: (bool? isActive) {
                          setState(() {
                            city.active = isActive!;
                          });
                        },
                        value: city.active,
                        title: Text(city.name),
                      ),
                      background: Container(
                          child: Icon(Icons.delete_forever),
                          decoration: BoxDecoration(color: Colors.red[700])),
                    );
                  }))
        ]),
      ),
    );
  }
}

class SegmentedControl extends StatefulWidget {
  const SegmentedControl({super.key});

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int selectedIndex = 0;
  bool isEditable = true;
  late List<String> segments;
  //* 아예 새로운 값을 만드는게 맞다
  //* 함수를 너무 많이 써놔... 똑같은건데 ㅅㅂ

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: isEditable ? Theme.of(context).primaryColor : Colors.grey,
              width: 1.3),
          borderRadius: BorderRadius.all(const Radius.circular(3.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: createSegments(),
      ),
    );
  }

  List<Widget> createSegments() {
    if (segments.isEmpty == true) return [];
    if (segments.last == null) return [];

    List<Color> childBorders = [];
    List<Widget> segmentWidgets = [];
    segments.forEach((segment) {
      int index = segments.indexOf(segment);

      if (segment == segments.last) {
        childBorders.add(Colors.transparent);
      } else {
        childBorders
            .add(isEditable ? Theme.of(context).primaryColor : Colors.grey);
      }

      segmentWidgets.add(Expanded(
          child: InkWell(
        onTap: isEditable
            ? () {
                setState(() {
                  selectedIndex = segments.indexOf(segment);
                });
              }
            : null,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: BoxDecoration(
              color: selectedIndex == segments.indexOf(segment)
                  ? isEditable
                      ? Theme.of(context).primaryColor
                      : Colors.grey
                  : Colors.white,
              border: Border(right: BorderSide(color: childBorders[index]))),
          child: Text(
            segment,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: selectedIndex == segments.indexOf(segment)
                    ? Colors.white
                    : isEditable
                        ? Theme.of(context).primaryColor
                        : Colors.grey),
          ),
        ),
      )));
    });

    return segmentWidgets;
  }
}
