import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/data/providers/todo_provider.dart';
import 'package:todo_app/presentation/widgets/text_form_field_widget.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key, this.isNewTodo = false});
  final bool isNewTodo;

  @override
  ConsumerState<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  //! variables
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  //! functions
  void _resetForm(context) {
    _formKey.currentState?.reset();
  }

  void _saveButtonClick(ref) {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
      final todoNotifier = ref.watch(todoProvider.notifier);
      todoNotifier.addNewTodo(
        Todo(
          title: title,
          description: description,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormFieldWidget(
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  onSave: (String? newValue) => title = newValue ?? '',
                  title: 'Enter Title',
                ),
                SizedBox(height: 15),
                TextFormFieldWidget(
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter description";
                    } else if (value.length < 10) {
                      return "Be more descriptive";
                    }
                    return null;
                  },
                  onSave: (String? newValue) => description = newValue ?? '',
                  title: 'Enter Description',
                ),
                // if (!isNewTodo)
                //   TextFormFieldWidget(
                //     validator: (String? value) {
                //       if (value == null || value.trim().isEmpty) {
                //         return "Please enter title";
                //       }
                //       return null;
                //     },
                //     onSave: (String? newValue) => description = newValue ?? '',
                //     title: 'Enter Title',
                //   ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => _resetForm(context),
                      child: Text("Reset"),
                    ),
                    SizedBox(width: 5),
                    FilledButton(
                      onPressed: () => _saveButtonClick(ref),
                      child: Text("Save"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
