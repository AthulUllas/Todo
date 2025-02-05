import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/models/completed_todo_model.dart';

part 'completedcontroller.g.dart';

@riverpod
class CompletedtodoNotifier extends _$CompletedtodoNotifier {
  @override
  List<CompletedTodoModel> build() {
    return [];
  }

  void addToCompleted(String title, String description) {
    state = [
      ...state,
      CompletedTodoModel(title: title, description: description)
    ];
  }

  void deleteTodo(int index) {
    state = [...state]..removeAt(index);
  }
}
