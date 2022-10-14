import 'package:flutter/material.dart';
import "package:weather_app/models/model_forecast.dart";
import 'package:weather_app/enums/enum_date.dart';

class TableWeekend extends StatelessWidget {
  const TableWeekend({super.key});

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
        children: [],
      ),
    );
  }
}