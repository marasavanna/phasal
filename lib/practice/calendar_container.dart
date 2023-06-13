import 'package:flutter/material.dart';
import 'item_calendar.dart';
import 'greeting_container.dart';

class CalendarContainer extends StatefulWidget {
  const CalendarContainer({super.key});

  @override
  State<StatefulWidget> createState() => CalendarContainerState();
}

class CalendarContainerState extends State<CalendarContainer> {
  final List _dates = ['18','19', '20', '21', '22'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      padding: const EdgeInsets.only(top: 80, bottom: 20, left: 10, right: 10),
      decoration: const BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const GreetingContainer(name: 'Mara', phase: 'Follicular'),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _dates.length,
                        itemBuilder: (context, index) {
                          return CalendarItem(date: _dates[index]);
                        })),
              )
            ],
          ),
        ],
      ),
    );
  }
}
