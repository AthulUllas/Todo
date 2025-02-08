import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/models/completed_todo_model.dart';

part 'completedcontroller.g.dart';

@Riverpod(keepAlive: true)
class CompletedtodoNotifier extends _$CompletedtodoNotifier {
  @override
  List<CompletedTodoModel> build() {
    return loadCompletedTodos();
  }

  final completedTodoStorage = GetStorage("completed todos");

  List<CompletedTodoModel> loadCompletedTodos() {
    final storedCompletedTodo =
        completedTodoStorage.read<List>("completed todos");
    if (storedCompletedTodo == null) return [];
    return storedCompletedTodo
        .map(
            (todo) => CompletedTodoModel.fromJson(todo as Map<String, dynamic>))
        .toList();
  }

  void saveCompletedTodos() {
    final completedTodoJson = state.map((todo) => todo.toJson()).toList();
    completedTodoStorage.write('completed todos', completedTodoJson);
  }

  void addToCompleted(String title, String description, bool isCompleted) {
    final newTodo = CompletedTodoModel(title: title, description: description);
    state = [newTodo, ...state];
    saveCompletedTodos();
  }

  void deleteTodo(int index) {
    if (index < 0 || index >= state.length) return;
    state = [...state]..removeAt(index);
    saveCompletedTodos();
  }
}
