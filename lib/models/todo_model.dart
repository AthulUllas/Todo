import 'package:flutter/material.dart';

class TodoModel {
  final String title;
  final String description;
  final bool isCompleted;
  final TimeOfDay time;

  TodoModel(
      {required this.description,
      required this.title,
      required this.isCompleted,
      required this.time});

  TodoModel copyWith({
    String? title,
    String? description,
    TimeOfDay? time,
    bool? isCompleted,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
