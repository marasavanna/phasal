import 'package:flutter/material.dart';
import 'package:phasal/utils/colors.dart';
import 'package:phasal/utils/extensions.dart';

import '../utils/date_utils.dart';

class DateItem extends StatelessWidget {
  final DateTime date;

  // final DateTime dateTime;

  const DateItem({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(getFormattedWeekday(date.weekday),
              style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 14,
                  fontWeight: FontWeight.w400))),
      CircleAvatar(
        radius: 15,
        backgroundColor: dateBackgroundColor(),
        child: Center(
          child: Text(
            date.day.toString(),
            style: dateStyle(),
          ),
        ),
      )
    ]);
  }

  dateBackgroundColor() {
    if (isCurrentDate(date)) {
      return accentColor.toColor();
    } else {
      return Colors.transparent;
    }
  }

  dateStyle() {
    return const TextStyle(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600);
  }
}
