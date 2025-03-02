import 'package:uuid/uuid.dart';

final Uuid _uuid = Uuid();

class Todo {
  final String? id;
  final String title;
  final String description;
  final TodoStatus status;

  Todo({
    String? id,
    this.title = "No Title",
    this.description = "No description",
    this.status = TodoStatus.notStarted,
  }) : id = id ?? _uuid.v4();
}

enum TodoStatus { notStarted, inProgress, completed, all }

List<Todo> todos = [
  Todo(
    title: "Buy groceries",
    description: "Milk, Bread, Eggs",
    status: TodoStatus.notStarted,
  ),
  Todo(
    title: "Write report",
    description: "Finish the quarterly report",
    status: TodoStatus.inProgress,
  ),
  Todo(
    title: "Exercise",
    description: "Go for a 30-minute run",
    status: TodoStatus.completed,
  ),
];
