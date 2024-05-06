import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:table_calendar/table_calendar.dart';

class PickerDateWidget extends StatefulWidget {
  final Function(DateTime) onSelected;

  const PickerDateWidget({
    super.key,
    required this.onSelected,
  });

  @override
  State<StatefulWidget> createState() => _PickerDateWidgetState();
}

class _PickerDateWidgetState extends State<PickerDateWidget> {
  final DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: TableCalendar(
        focusedDay: _currentDate,
        firstDay: _currentDate,
        lastDay: _currentDate.add(
          const Duration(days: 60),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        onDaySelected: (date, events) {
          if (date.weekday != DateTime.sunday) {
            widget.onSelected(date);
          }
        },
        selectedDayPredicate: (day) => isSameDay(day, _currentDate),
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: CalendarStyle(
          disabledDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline,
          ),
          outsideDaysVisible: false,
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          weekendDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline,
          ),
          defaultDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer),
          todayDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        weekendDays: const [DateTime.sunday],
      ),
    );
  }
}
