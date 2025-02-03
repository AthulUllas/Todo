import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_controller.g.dart';
part 'todo_controller.freezed.dart';

@freezed
class TodoNotifier with _$TodoNotifier {
  factory TodoNotifier(
      {required String title,
      required String description,
      required bool isCompleted}) = _TodoNotifier;
}

@riverpod
class Todo extends _$Todo {
  @override
  List<TodoNotifier> build() {
    return [];
  }

  void addTodo(TodoNotifier todo) {
    state = [...state, todo];
  }

  void removeTodo(String todoTitle) {
    state = state.where((todo) => todoTitle != todoTitle).toList();
  }
}
