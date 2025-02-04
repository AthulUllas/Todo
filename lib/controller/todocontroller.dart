import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/models/todo_model.dart';

part 'todocontroller.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  List<TodoModel> build() {
    return [];
  }

  void addTodo(String title, String description, TimeOfDay time) {
    state = [
      ...state,
      TodoModel(description: description, title: title, time: time)
    ];
  }

  void removeTodo(int index) {
    state = [...state]..removeAt(index);
  }
}
