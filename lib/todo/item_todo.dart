import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phasal/todo/item_todo_bubble.dart';
import 'package:phasal/todo/item_todo_checkmark.dart';
import 'package:phasal/todo/item_todo_description.dart';

import '../model/TodoItemUi.dart';
import '../repository/todo_repository.dart';

class TodoWidget extends StatefulWidget {
  TodoItemUi todoItem;
  bool isLastItem;
  // final dynamic deleteItemRefreshFunc;

  TodoWidget({super.key, required this.todoItem, required this.isLastItem});
    // , required this.deleteItemRefreshFunc});

  @override
  State<StatefulWidget> createState() => TodoWidgetState();
}

class TodoWidgetState extends State<TodoWidget> {
  final TodoRepository repository = TodoRepository();

  void refresh(bool isComplete) {
    setState(() {
      widget.todoItem.isComplete = isComplete;
    });
    repository.updateTodoItem(widget.todoItem.id, widget.todoItem.isComplete);
  }

  void handleItemDelete(String itemId) {
    repository.deleteTodoItem(itemId);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(widget.todoItem.id),
        background: Container(color: Colors.red),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          handleItemDelete(widget.todoItem.id);
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TodoItemBubble(
                    isLastItem: widget.isLastItem,
                    isElementChecked: widget.todoItem.isComplete),
                TodoDescriptionItem(todoItem: widget.todoItem),
                TodoCheckmarkItem(
                    isChecked: widget.todoItem.isComplete,
                    getRefreshFunc: refresh)
              ],
            )));
  }
}
