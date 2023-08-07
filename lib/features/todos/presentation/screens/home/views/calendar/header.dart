import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/constants/styles.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/calendar.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/date_extension.dart';

class Header extends StatelessWidget {
  const Header({super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.onChange,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
              ' ${weekdays[selectedDate!.weekday-1]}.${months[selectedDate!.month-1]}.${selectedDate!.year}'),
          Row(
            children: [
              Text(
                months[selectedMonth.month - 1],
                style: Styles.ts14semibold,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  onChange(selectedMonth.addMonth(-1));
                },
                icon: const Icon(CupertinoIcons.chevron_left_circle_fill),
              ),
              IconButton(
                onPressed: () {
                  onChange(selectedMonth.addMonth(1));
                },
                icon: const Icon(CupertinoIcons.chevron_right_circle_fill),
              ),
            ],
          ),
        ],
      ),
    );
  }
}