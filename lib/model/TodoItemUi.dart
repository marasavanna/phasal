import 'dart:ffi';

class TodoItemUi {
  String id;
  String description;
  String startTime;
  String endTime;
  String durationMillis;
  bool isComplete;

  TodoItemUi(
      {required this.id,
      required this.description,
      required this.endTime,
      required this.startTime,
      required this.durationMillis,
      required this.isComplete});
}
