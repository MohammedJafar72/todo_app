import 'package:flutter/material.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/presentation/widgets/todo_status_widget.dart';

class TodoFilter extends StatelessWidget {
  const TodoFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.filter_alt_rounded,
          size: 29,
          color: AppColors.iconColor,
        ),
        TodoStatusWidget(status: TodoStatus.all)
      ],
    );
  }
}
