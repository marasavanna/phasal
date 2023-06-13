import 'package:flutter/material.dart';
import 'package:phasal/todo/add_todo_item_bottom_sheet.dart';
import 'package:phasal/todo/todo_list.dart';
import 'package:phasal/utils/colors.dart';
import 'package:phasal/utils/extensions.dart';

import 'appbar.dart';
import 'calendar/week_view_calendar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 16),
            child: FloatingActionButton(
              backgroundColor: accentColor.toColor(),
              foregroundColor: Colors.white,
              elevation: 12,
              tooltip: 'Add item',
              highlightElevation: 20,
              onPressed: () => {displayAddItemModal(context)},
              child: const Center(child: Icon(Icons.add)),
            )),
        appBar:
            TrackerAppBar(month: 'May', year: DateTime.now().year.toString()),
        backgroundColor: backgroundColor.toColor(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [WeekViewCalendar()],
              ),
              Row(
                children: [TodoList()],
              )
            ],
          ),
        ));
  }

  displayAddItemModal(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        context: context, builder: (context) => AddTodoItemModal());
  }
}
