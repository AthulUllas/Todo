import 'package:flutter/material.dart';

class CompletedTodoModel {
  final String title;
  final String description;
  final bool isCompleted;
  final TimeOfDay time;

  CompletedTodoModel(
      {required this.title,
      required this.description,
      required this.isCompleted,
      required this.time});
}
