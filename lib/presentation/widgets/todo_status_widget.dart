import 'package:flutter/material.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/data/models/todo.dart';

class TodoStatusWidget extends StatelessWidget {
  final TodoStatus status;
  const TodoStatusWidget({
    super.key,
    required this.status,
  });

  String get statusText {
    switch (status) {
      case TodoStatus.completed:
        return 'Completed';
      case TodoStatus.inProgress:
        return 'In Progress';
      case TodoStatus.notStarted:
        return 'Not Started';
      case TodoStatus.all:
        return 'All';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 33,
      decoration: BoxDecoration(
        color: status == TodoStatus.completed
            ? TodoColors.completed
            : status == TodoStatus.inProgress
                ? TodoColors.inProgress
                : status == TodoStatus.notStarted
                    ? TodoColors.notStarted
                    : TodoColors.all,
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: Center(
        child: Text(
          statusText,
          style: TextStyle(
              color: status == TodoStatus.all
                  ? AppColors.textPrimary
                  : AppColors.primary,
              fontSize: 12),
        ),
      ),
    );
  }
}
