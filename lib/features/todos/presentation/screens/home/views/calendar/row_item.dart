import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/date_extension.dart';

// class RowItem extends StatelessWidget {
//   const RowItem({super.key,
//     required this.hasRightBorder,
//     required this.isActiveMonth,
//     required this.isSelected,
//     required this.date,
//     required this.onTap,
//   });
//
//   final bool hasRightBorder;
//   final bool isActiveMonth;
//   final VoidCallback onTap;
//   final bool isSelected;
//   final DateTime date;
//
//   @override
//   Widget build(BuildContext context) {
//     final int number = date.day;
//     final isToday = date.isToday;
//     final bool isPassed = date.isBefore(DateTime.now());
//
//     return GestureDetector(
//       onTap: onTap,
//       behavior: HitTestBehavior.opaque,
//       child: Container(
//         alignment: Alignment.center,
//         height: 35,
//         width: 35,
//         decoration: isSelected
//             ? const BoxDecoration(color: Colors.pink, shape: BoxShape.circle)
//             : isToday
//             ? BoxDecoration(
//           borderRadius: BorderRadius.circular(35),
//           border: Border.all(
//             color: Colors.pink,
//           ),
//         )
//             : null,
//         child: Column(
//           children: [
//             Text(
//               number.toString(),
//               style: TextStyle(
//                   fontSize: 14,
//                   color: isPassed
//                       ? isActiveMonth
//                       ? Colors.grey
//                       : Colors.transparent
//                       : isActiveMonth
//                       ? Colors.black
//                       : Colors.grey[300]),
//             ),
//             Container(
//               height: 5,
//               width: 5,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.red,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class RowItem extends StatelessWidget {
  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;
  final DateTime date;
  final List<int> eventModel;


  const RowItem({
    Key? key,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
 required this.eventModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          style: isSelected
              ? IconButton.styleFrom(backgroundColor: Colors.blue.shade300)
              : isToday
              ? IconButton.styleFrom(backgroundColor: Colors.pink.shade300)
              : null,
          icon: Text(
            number.toString(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isActiveMonth ? Colors.black : Colors.transparent),
          ),
        ),
        if(isActiveMonth) Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: eventModel.map((event) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
            );
          }).take(3).toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}