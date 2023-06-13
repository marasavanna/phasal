import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final String date;

  const CalendarItem({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          height: 84,
          width: 70,
          decoration: BoxDecoration(
              color: styleDateBoxDependingOnCurrent(),
              border: Border.all(color: Colors.white, width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Center(
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          )),
    );
  }

  styleDateBoxDependingOnCurrent() {
    if (isCurrentDate()) {
      return Colors.white38;
    } else {
      return Colors.transparent;
    }
  }

  isCurrentDate() {
    var date = DateTime.now().toLocal().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}";
    return formattedDate == this.date;
  }
}
