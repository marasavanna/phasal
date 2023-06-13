import 'package:flutter/material.dart';
import 'package:phasal/utils/extensions.dart';

import '../utils/colors.dart';

class AddTodoItemModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(12),
        alignment: Alignment.center,
        color: backgroundColor.toColor(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "MODAL BOTTOM SHEET EXAMPLE",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
        ]));
  }
}
