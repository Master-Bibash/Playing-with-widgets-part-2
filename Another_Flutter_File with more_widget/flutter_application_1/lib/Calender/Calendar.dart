import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime today;

  @override
  void initState() {
    super.initState();
    today = DateTime.now().isAfter(DateTime.utc(2024, 10, 16))
        ? DateTime.now()
        : DateTime.utc(2024, 10, 16);
    print(isSameDay(DateTime.now(), DateTime(2024)));
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _onFormatChanged(CalendarFormat format) {
    // Handle format change if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TableCalendar(
          locale: "en_US",
          focusedDay: today,
          firstDay: DateTime.utc(2024, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: _onDaySelected,
          onFormatChanged: _onFormatChanged,
        ),
      ),
    );
  }
}
