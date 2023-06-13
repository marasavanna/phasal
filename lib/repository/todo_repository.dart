import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phasal/model/TodoItem.dart';
import 'package:phasal/utils/firebase_constants.dart';

class TodoRepository {
  Future createTodoItem({required String description}) async {
    final docTodoItem =
    FirebaseFirestore.instance.collection(todoItemsCollection).doc();

    final todoItem = TodoItem(
        id: docTodoItem.id,
        description: description,
        startTime: DateTime(2023, 5, 23, 14, 25).hour.toString(),
        endTime: DateTime(2023, 5, 23, 15, 25).hour.toString(),
        isComplete: false,
        durationMillis: 3600);
    final json = todoItem.toJson();

    await docTodoItem.set(json);
  }

  Stream<List<TodoItem>> getTodoItems() =>
      FirebaseFirestore.instance
          .collection(todoItemsCollection)
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => TodoItem.fromJson(doc.data())).toList());

  updateTodoItem(String itemId, bool isComplete) =>
      FirebaseFirestore.instance
          .collection(todoItemsCollection)
          .doc(itemId)
          .update({
        'isComplete': isComplete,
      });


  deleteTodoItem(String itemId) =>  FirebaseFirestore.instance
      .collection(todoItemsCollection)
      .doc(itemId).delete();
}
