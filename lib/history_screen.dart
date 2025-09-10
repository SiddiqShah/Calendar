import 'package:flutter/material.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/month_header.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/bottom_navbar.dart';


List <DateTime> getMonthList(DateTime startMonth, DateTime endMonth) {
  List <DateTime> months = [];
  DateTime current = DateTime(startMonth.year, startMonth.month);
  while(current.isBefore(endMonth)|| 
  (current.year == endMonth.year && current.month == endMonth.month)) {
      months.add(current);
      current = DateTime(current.year, current.month + 1);
  }
  return months;
}

// List<DateTime> getMonthList(DateTime startMonth, DateTime endMonth) {
//   List<DateTime> months = [];
//   DateTime current = DateTime(startMonth.year, startMonth.month);
//   while (current.isBefore(endMonth) ||
//       (current.year == endMonth.year && current.month == endMonth.month)) {
//     months.add(current);
//     current = DateTime(current.year, current.month + 1);
//   }
//   return months;
// }

class HistoryScreen extends StatelessWidget {
  final DateTime firstDay = DateTime(2024, 1, 1);
  final DateTime lastDay = DateTime(2025, 10, 31); 

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final months = getMonthList(firstDay, DateTime(lastDay.year, lastDay.month));

    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F4),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(height: 20),
                ...months.map((month) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MonthHeader(
                      month: "${_getMonthName(month.month)} ${month.year}",
                    ),
                    const SizedBox(height: 10),
                    CalendarWidget(
                      focusedDay: month,
                      firstDay: firstDay,
                      lastDay: lastDay,
                    ),
                    const SizedBox(height: 20),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }
}