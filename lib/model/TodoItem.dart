class TodoItem {
  String id;
  String description;
  String startTime;
  String endTime;
  bool isComplete;
  int durationMillis;

  TodoItem(
      {required this.id,
      required this.description,
      required this.durationMillis,
      required this.isComplete,
      required this.endTime,
      required this.startTime});

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'startTime': startTime,
        'endTime': endTime,
        'isComplete': isComplete,
        'durationMillis': durationMillis
      };

  static TodoItem fromJson(Map<String, dynamic> json) => TodoItem(
      id: json['id'],
      description: json['description'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      isComplete: json['isComplete'],
      durationMillis: json['durationMillis']);
}
