import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/models/todo_model.dart';

part 'todocontroller.g.dart';

@Riverpod(keepAlive: true)
class TodoNotifier extends _$TodoNotifier {
  @override
  List<TodoModel> build() {
    return loadTodos();
  }

  final todoStorage = GetStorage("todos");

  List<TodoModel> loadTodos() {
    final storedTodos = todoStorage.read<List>('todos');
    if (storedTodos == null) return []; // Return empty list if no todos exist

    return storedTodos
        .map((todo) => TodoModel.fromJson(todo as Map<String, dynamic>))
        .toList();
  }

  void saveTodos() {
    final todoJson = state.map((todo) => todo.toJson()).toList();
    todoStorage.write('todos', todoJson);
  }

  void addTodo(
      String title, String description, TimeOfDay time, bool isCompleted) {
    state = [
      TodoModel(
          description: description,
          title: title,
          time: time,
          isCompleted: isCompleted),
      ...state
    ];
    saveTodos();
  }

  void removeTodo(int index) {
    state = [...state]..removeAt(index);
    saveTodos();
  }
}
