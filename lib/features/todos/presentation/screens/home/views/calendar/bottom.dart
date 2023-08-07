import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/constants/custom_button.dart';
import 'package:todo_udevs/features/todos/presentation/constants/styles.dart';
import 'package:todo_udevs/features/todos/presentation/screens/add/add_screen.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key,
    required this.selectedDate,
  });

  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Schedule",
            style: Styles.ts14semibold),
        const Spacer(),
        CustomButton(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AddScreen()));
          },
          width: 100,
          height: 30,
          widget: Text(
            "+ Add Event",
            style: Styles.ts14semibold.copyWith(color: Colors.white),
          ),
        )
        // const Text('+Add Event'),
      ],
    );
  }
}