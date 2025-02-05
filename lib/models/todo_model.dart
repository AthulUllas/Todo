import 'package:flutter/material.dart';

class TodoModel {
  String title;
  String description;
  bool isCompleted;
  TimeOfDay time;

  TodoModel(
      {required this.description,
      required this.title,
      required this.isCompleted,
      required this.time});
}
