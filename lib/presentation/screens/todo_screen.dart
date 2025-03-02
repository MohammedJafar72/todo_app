import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/data/providers/todo_provider.dart';
import 'package:todo_app/presentation/screens/add_todo.dart';
import 'package:todo_app/presentation/widgets/todo_filter.dart';
import 'package:todo_app/presentation/widgets/todo_status_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Todos"),
        actions: [
          TodoFilter(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FilledButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(
                  Size(30, 33),
                ),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddTodo(
                    isNewTodo: true,
                  ),
                ),
              ),
              child: Icon(Icons.add, size: 20),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer(builder: (context, ref, child) {
          final todos = ref.watch(todoProvider);
          return todos.isEmpty
              ? Center(
                  child: Text("No Todo Yet..."),
                )
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final Todo todo = todos[index];
                    final TodoStatus status = todo.status;
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      color: AppColors.primary,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        title: Text(todo.title),
                        subtitle: Text(
                          todo.description,
                          style: TextStyle(color: AppColors.tertiary),
                        ),
                        trailing: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TodoStatusWidget(status: status),
                            Icon(Icons.chevron_right_rounded,
                                size: 29, color: AppColors.iconColor)
                          ],
                        ),
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
