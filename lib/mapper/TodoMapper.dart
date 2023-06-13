import 'package:phasal/model/TodoItem.dart';
import 'package:phasal/model/TodoItemUi.dart';

class TodoMapper {
  mapTodoItemToUIItem(TodoItem todoItem) {
    return TodoItemUi(
        id: todoItem.id,
        description: todoItem.description,
        startTime: todoItem.startTime,
        endTime: todoItem.endTime,
        durationMillis: todoItem.durationMillis.toString(),
        isComplete: todoItem.isComplete);
  }

  mapTodoItemsToUIItems(List<TodoItem> items) =>
      items.map((e) => mapTodoItemToUIItem(e)).toList();
}
