import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../helper/day_builder.dart'; // Adjust the import as per your folder structure

class CalendarWidget extends StatefulWidget {
  final DateTime focusedDay;
  final DateTime firstDay;
  final DateTime lastDay;

  const CalendarWidget({
    super.key,
    required this.focusedDay,
    required this.firstDay,
    required this.lastDay,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: widget.firstDay,
      lastDay: widget.lastDay,
      focusedDay: widget.focusedDay,
      selectedDayPredicate: (day) => _selectedDay != null && isSameDay(day, _selectedDay),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      headerVisible: false,
      calendarStyle: CalendarStyle(
        cellMargin: const EdgeInsets.all(0),
        outsideDaysVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w600,
        ),
        weekendStyle: TextStyle(
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w600,
        ),
      ),
      availableGestures: AvailableGestures.none,
      pageJumpingEnabled: false,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          return CustomDay(
            date: date,
            isSelected: false, 
            isToday: isSameDay(date, DateTime.now()),
          );
        },
      ),
    );
  }
}