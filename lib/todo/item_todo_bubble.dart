import 'package:flutter/material.dart';
import 'package:phasal/utils/colors.dart';
import 'package:phasal/utils/extensions.dart';

class TodoItemBubble extends StatelessWidget {
  bool isLastItem;
  bool isElementChecked;

  TodoItemBubble(
      {super.key, required this.isLastItem, required this.isElementChecked});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: getBubbleColor(),
              child: Center(
                child: Icon(Icons.calendar_month, color: getIconColor()),
              ),
            )
          ],
        ),
        Row(children: [
          Visibility(
              visible: !isLastItem,
              child: Container(
                width: 3,
                height: 15,
                color: getBubbleColor(),
              ))
        ]),
      ],
    );
  }

  getBubbleColor() {
    if (isElementChecked) {
      return accentColorSemiTransparent.toColor();
    } else {
      return accentColor.toColor();
    }
  }

  getIconColor() {
    if (isElementChecked) {
      return Colors.grey;
    } else {
      return Colors.white;
    }
  }
}
