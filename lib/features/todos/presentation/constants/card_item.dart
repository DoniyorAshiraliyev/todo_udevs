import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/constants/styles.dart';

class CardItem extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String eventName;
  final String eventDescription;
  final String eventLocation;
  final String eventTime;
  final void Function()? onTap;

  const CardItem({
    super.key,
    required this.color,
    required this.textColor,
    required this.eventName,
    required this.eventDescription,
    required this.eventLocation,
    required this.eventTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 90,
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: Styles.ts14semibold.copyWith(color: textColor),
                    maxLines: 1,
                  ),
                  Text(
                    eventDescription,
                    style: Styles.ts8regular.copyWith(color: textColor),
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: textColor,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          eventTime,
                          style: Styles.ts10medium.copyWith(color: textColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      eventLocation.isEmpty?const SizedBox():
                      Icon(
                        Icons.location_on_rounded,
                        color: textColor,
                        size: 20,
                      ),

                      const SizedBox(width: 5),

                      Expanded(
                        child: Text(
                          eventLocation,
                          style: Styles.ts10medium.copyWith(color: textColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
