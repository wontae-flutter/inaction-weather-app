import 'package:flutter/material.dart';
import 'package:weather_app/animations/animation_forecast.dart';
import 'package:weather_app/providers/providers_forecast.dart';

class TimePickerRow extends StatefulWidget {
  @override
  State<TimePickerRow> createState() => _TimePickerRowState();
}

class _TimePickerRowState extends State<TimePickerRow>
    with SingleTickerProviderStateMixin {
  //! 나중에 빌드할 때 써야되지 않나? provider 가 필요하죠
  late final ForecastProvider forecastProvider;
  List<int> hours = [3, 6, 9, 12, 15, 18, 21, 24];
  int currentIndex = 0;
  final List<Widget> tabItems = [];
  late final Function onTabChange;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: hours.length,
      vsync: this,
      initialIndex: currentIndex,
    );
    _tabController.addListener(handleTabChange);
  }

  void handleTabChange() {
    //* 애니메이션 중간에 새 이벤트가 발생하는 것을 방지
    if (_tabController.indexIsChanging) return;
    onTabChange(_tabController.index);
    setState(() {
      currentIndex = _tabController.index; //* 현재 선택된 탭 인덱스
    });
  }

  //* 탭의 위치나 애니메이션 상태 등을 확인할 수 있는 기능을 제공
  //* 탭이 이동할 때마다 동작을 추가하고 싶으면 addEventlistener 함수를 사용하세요.

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabItems,
      controller: _tabController,
      isScrollable: true,
      indicatorColor: Colors.transparent,
      labelColor: Colors.black,
      labelStyle: Theme.of(context).textTheme.caption?.copyWith(fontSize: 12.0),
      labelPadding: EdgeInsets.symmetric(horizontal: 48, vertical: 8),
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle:
          Theme.of(context).textTheme.caption?.copyWith(fontSize: 10.0),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
