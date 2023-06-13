import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phasal/utils/colors.dart';
import 'package:phasal/utils/extensions.dart';

class TodoCheckmarkItem extends StatelessWidget {


  TodoCheckmarkItem({super.key, required this.isChecked, required this.getRefreshFunc});

  final dynamic getRefreshFunc;
  bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              isChecked = !isChecked;
              getRefreshFunc(isChecked);
            },
            child: handleCheckboxDependingOnCheck(isChecked))
      ],
    );
  }

  handleCheckboxDependingOnCheck(bool isChecked) {
    if (isChecked) {
      return CircleAvatar(
        radius: 10,
        backgroundColor: accentColor.toColor(),
        child: Center(
          child: Icon(
            Icons.check,
            color: backgroundColor.toColor(),
            size: 14,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: accentColor.toColor())),
      );
    }
  }
}
