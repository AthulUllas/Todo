import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_controller.g.dart';
part 'todo_controller.freezed.dart';

@freezed
class TodoNotifier with _$TodoNotifier {
  factory TodoNotifier(
      {required List todos,
      required String title,
      required String description}) = _TodoNotifier;
}

@riverpod
class Todo extends _$Todo {
  @override
  List<TodoNotifier> build() {
    return [];
  }

  void addTodo(
    TodoNotifier todo,
  ) {
    // Add todo to the list
    state = [...state, todo];
  }
}
