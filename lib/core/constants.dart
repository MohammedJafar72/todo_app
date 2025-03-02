import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1A1A1A);
  static const Color secondary = Color(0xFF2D2D2D);
  static const Color tertiary = Color.fromARGB(255, 99, 99, 99);
  static const Color background = Color(0xFF121212);
  static const Color textPrimary = Color(0xFFF7F7F7);
  static const Color textSecondary = Color(0xFFBDBDBD);
  static const Color textTertiary = Color(0xFF9E9E9E);
  static const Color iconColor = Color.fromARGB(255, 192, 192, 192);
}

class TodoColors {
  static const Color completed = Color(0xFF4CAF50);
  static const Color inProgress = Color(0xFFFFC107);
  static const Color notStarted = Color(0xFFF44336);
  static const Color all = AppColors.tertiary;
}
