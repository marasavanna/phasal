import 'package:flutter/material.dart';
import 'package:phasal/calendar/item_calendar_new.dart';
import 'package:phasal/utils/extensions.dart';
import '../utils/colors.dart';
import '../utils/date_utils.dart';

class WeekViewCalendar extends StatelessWidget {
  final List _dates =
      generateDatesInInterval(DateTime.now(), DateTime(2024, 2, 20));

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: appBarColor.toColor(),
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _dates.length,
                itemBuilder: (context, index) {
                  return DateItem(
                    date: _dates[index],
                  );
                })));
  }
}
