import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PickerDateWidget extends StatefulWidget {
  const PickerDateWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PickerDateWidgetState();
}

class _PickerDateWidgetState extends State<PickerDateWidget> {
  DateTime _currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        // locale: 'vi_VN',
        focusedDay: _currentDate,
        firstDay: _currentDate,
        lastDay: _currentDate.add(
          const Duration(days: 60),
        ),
      );
  }
}
