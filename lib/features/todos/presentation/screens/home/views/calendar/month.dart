import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/date_extension.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/day.dart';
//
// class CalendarMonthData {
//   final int year;
//   final int month;
//
//   int get daysInMonth => DateUtils.getDaysInMonth(year, month);
//
//   int get firstDayOfWeekIndex => 0;
//
//   int get weeksCount => ((daysInMonth + firstDayOffset) / 7).ceil();
//
//   const CalendarMonthData({
//     required this.year,
//     required this.month,
//   });
//
//   int get firstDayOffset {
//     final int weekdayFromMonday = DateTime(year, month).weekday - 1;
//
//     return (weekdayFromMonday - ((firstDayOfWeekIndex - 1) % 7)) % 7 - 1;
//   }
//
//   List<List<CalendarDayData>> get weeks {
//     final res = <List<CalendarDayData>>[];
//     var firstDayMonth = DateTime(year, month, 1);
//     var firstDayOfWeek = firstDayMonth.subtract(Duration(days: firstDayOffset));
//
//     for (var w = 0; w < weeksCount; w++) {
//       final week = List<CalendarDayData>.generate(
//         7,
//             (index) {
//           final date = firstDayOfWeek.add(Duration(days: index));
//
//           final isActiveMonth = date.year == year && date.month == month;
//
//           return CalendarDayData(
//             date: date,
//             isActiveMonth: isActiveMonth,
//             isActiveDate: date.isToday,
//           );
//         },
//       );
//       res.add(week);
//       firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
//     }
//     return res;
//   }
// }
class CalendarMonthData {
  final int year;
  final int month;

  int get daysInMonth => DateUtils.getDaysInMonth(year, month);

  int get firstDayOfWeekIndex => 0;

  int get weeksCount => ((daysInMonth + firstDayOffset) / 7).ceil();

  const CalendarMonthData({
    required this.year,
    required this.month,
  });

  int get firstDayOffset {
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;
    final result = (weekdayFromMonday - ((firstDayOfWeekIndex - 1) % 7)) % 7 - 1;
    return result == -1 ? 6 : result;
  }

  List<List<CalendarDayData>> get weeks {
    final res = <List<CalendarDayData>>[];
    var firstDayMonth = DateTime(year, month, 1);
    var firstDayOfWeek = firstDayMonth.subtract(Duration(days: firstDayOffset));

    for (var w = 0; w < weeksCount; w++) {
      final week = List<CalendarDayData>.generate(
        7,
            (index) {
          final date = firstDayOfWeek.add(Duration(days: index));

          final isActiveMonth = date.year == year && date.month == month;

          return CalendarDayData(
            date: date,
            isActiveMonth: isActiveMonth,
            isActiveDate: date.isToday,
          );
        },
      );
      res.add(week);
      firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
    }
    return res;
  }
}
