import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/models/todo_model.dart';

part 'todocontroller.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [];
  }
}

void addTodo(
    String title, String description, bool isCompleted, TimeOfDay time) {
  state = [
    ...state,
    TodoModel(
        title: title,
        description: description,
        isCompleted: isCompleted,
        time: time)
  ];
}

void removeTodo(int index) {
  state = [...state]..removeAt(index);
}
