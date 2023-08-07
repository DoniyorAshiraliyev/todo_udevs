// _Header(
//   selectedMonth: selectedMonth,
//   selectedDate: selectedDate,
//   onChange: (value) =>
//       setState(() => selectedMonth = value),
// ),
// _Body(
//   selectedDate: selectedDate,
//   selectedMonth: selectedMonth,
//   selectDate: (DateTime value) => setState(() {
//     selectedDate = value;
//   }),
// ),
// _Bottom(
//   selectedDate: selectedDate,
// ),

import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/body.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/bottom.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/date_extension.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/header.dart';

class CalendarItem extends StatefulWidget {

  const CalendarItem({super.key});

  @override
  State<CalendarItem> createState() => _CalendarItemState();
}

class _CalendarItemState extends State<CalendarItem> {
  late  DateTime selectedMonth;
  DateTime? selectedDate = DateTime.now();
  // selectedMonth = DateTime.now().monthStart;
  @override
  void initState() {
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Header(
          selectedMonth: selectedMonth,
          selectedDate: selectedDate,
          onChange: (value) =>
              setState(() => selectedMonth = value),
        ),
        Body(
          selectedDate: selectedDate,
          selectedMonth: selectedMonth,
          selectDate: (DateTime value) => setState(() {
            selectedDate = value;
          }),
        ),
        Bottom(
          selectedDate: selectedDate,
        ),

      ],
    );
  }
}

const List<String> weekdays = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];
const List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

