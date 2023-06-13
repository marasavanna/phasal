import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phasal/mapper/TodoMapper.dart';
import 'package:phasal/model/TodoItem.dart';
import 'package:phasal/repository/todo_repository.dart';
import 'package:phasal/todo/item_todo.dart';

import '../utils/date_utils.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});

  final todoRepository = TodoRepository();
  final todoMapper = TodoMapper();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            child: StreamBuilder<List<TodoItem>>(
                stream: todoRepository.getTodoItems(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong ${snapshot.error}!');
                  } else if (snapshot.hasData) {
                    final todoItems = snapshot.data!;
                    final todoUIItems =
                    todoMapper.mapTodoItemsToUIItems(todoItems.toList());
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: todoUIItems.length,
                        itemBuilder: (context, index) {
                          return TodoWidget(
                              todoItem: todoUIItems[index],
                              isLastItem: index == todoUIItems.length - 1);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
