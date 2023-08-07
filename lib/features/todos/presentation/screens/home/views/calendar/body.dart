import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/calendar.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/date_extension.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/month.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/row_item.dart';

class Body extends StatelessWidget {
  const Body({super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> selectDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            weekdays.length,
                (index) => Text(
              weekdays[index].substring(0, 3),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  return Expanded(
                    child: RowItem(
                      eventModel: [],
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () => selectDate(d.date),
                      isSelected: selectedDate != null &&
                          selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }
}