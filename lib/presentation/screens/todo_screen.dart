import 'package:flutter/material.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/presentation/widgets/todo_filter.dart';
import 'package:todo_app/presentation/widgets/todo_status_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TodoFilter(),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final Todo todo = todos[index];
                    final TodoStatus status = todo.status;
                    return Card(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
