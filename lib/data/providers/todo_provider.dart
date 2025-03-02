import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/models/todo.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addNewTodo(Todo todo) {
    debugPrint(" ${todo.id} ${todo.title} ${todo.description} ${todo.status}");
    state = [...state, todo];
  }
}
