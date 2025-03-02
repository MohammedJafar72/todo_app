import 'package:flutter/material.dart';
import 'package:todo_app/core/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.validator,
    required this.onSave,
    required this.title,
  });

  final String title;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSave;

  String get text => title.trim() != '' ? title : "";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.iconColor
              : Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.iconColor
                : Colors.black54,
          ),
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.iconColor
            : Colors.black,
      ),
      validator: validator,
      onSaved: onSave,
    );
  }
}
