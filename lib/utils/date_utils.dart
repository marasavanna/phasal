import 'package:intl/intl.dart';

import '../model/TodoItemUi.dart';

isCurrentDate(DateTime givenDateTime) {
  var date = DateTime.now().toLocal().toString();
  var dateParse = DateTime.parse(date);
  var formattedDay = "${dateParse.day}";
  var formattedMonth = "${dateParse.month}";
  var formattedYear = "${dateParse.year}";
  return formattedDay == givenDateTime.day.toString()
      && formattedMonth == givenDateTime.month.toString()
      && formattedYear == givenDateTime.year.toString() ;
}

generateDatesInInterval(DateTime startDate, DateTime endDate) {
  final daysToGenerate = endDate.difference(startDate).inDays;
  return List.generate(daysToGenerate, (i) => DateTime(startDate.year, startDate.month, startDate.day + (i)));
}

getFormattedWeekday(int weekday) {
  final DateTime now = DateTime.now().toLocal();
  final int diff = now.weekday - weekday; // weekday is our 1-7 ISO value
  var udpatedDt;
  if (diff > 0) {
    udpatedDt = now.subtract(Duration(days: diff));
  } else if (diff == 0) {
    udpatedDt = now;
  } else {
    udpatedDt = now.add(Duration(days: diff * -1));
  }
  final String weekdayName = DateFormat('EEE').format(udpatedDt);
  return weekdayName;
}