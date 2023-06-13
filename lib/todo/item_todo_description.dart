
import 'package:flutter/material.dart';
import 'package:phasal/model/TodoItemUi.dart';

class TodoDescriptionItem extends StatelessWidget {
  TodoItemUi todoItem;

  TodoDescriptionItem({super.key, required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 64, bottom: 4),
              child: Text(
                '${todoItem.startTime}-${todoItem.endTime} (${todoItem.durationMillis})',
                style: const TextStyle(
                    color: Colors.grey, fontSize: 14, letterSpacing: 0.5),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
                padding:
                    const EdgeInsets.only(left: 16, right: 64, bottom: 12),
                child: Text(
                  todoItem.description,
                  style: TextStyle(
                      color: getTextColor(), fontSize: 17, letterSpacing: 0.5, fontWeight: FontWeight.w600),
                ))
          ],
        )
      ],
    );
  }

  getTextColor() {
    if (todoItem.isComplete) {
      return Colors.grey;
    } else {
      return Colors.white;
    }
  }
}
