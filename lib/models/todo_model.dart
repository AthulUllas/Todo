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

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final timeParts = json['time'].split(':');
    return TodoModel(
      title: json['title'],
      description: json['description'],
      time: TimeOfDay(
          hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1])),
      isCompleted: json['isCompleted'],
    );
  }

  // Convert a TodoModel instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'time': '${time.hour}:${time.minute}', // Convert TimeOfDay to String
      'isCompleted': isCompleted,
    };
  }

  // Helper method for updating properties
  TodoModel copyWith(
      {String? title,
      String? description,
      TimeOfDay? time,
      bool? isCompleted}) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
