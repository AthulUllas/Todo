import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/models/completed_todo_model.dart';

part 'completedcontroller.g.dart';

@Riverpod(keepAlive: true)
class CompletedtodoNotifier extends _$CompletedtodoNotifier {
  @override
  List<CompletedTodoModel> build() {
    return [];
  }

  void addToCompleted(String title, String description, bool isCompleted) {
    final newTodo = CompletedTodoModel(title: title, description: description);
    state = [newTodo, ...state];
  }

  void deleteTodo(int index) {
    if (index < 0 || index >= state.length) return;
    state = [...state]..removeAt(index);
  }
}
