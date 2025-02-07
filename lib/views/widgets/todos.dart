import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/controller/completedcontroller.dart';
import 'package:todo/controller/todocontroller.dart';

class TodosList extends HookConsumerWidget {
  const TodosList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);
    final todo = ref.read(todoNotifierProvider.notifier);
    final completedTodo = ref.read(completedtodoNotifierProvider.notifier);
    return Expanded(
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todoList = todos[index];
            final timeInString = todoList.time.format(context);
            void switchToCompleted(int index, WidgetRef ref) {
              final todoNotifier = ref.read(todoNotifierProvider.notifier);
              final completedTodoNotifier =
                  ref.read(completedtodoNotifierProvider.notifier);
              final todos = ref.read(todoNotifierProvider);

              if (index < 0 || index >= todos.length)
                return; // Prevent index out of range errors

              final todoItem = todos[index];

              print(
                  "✅ Moving to completed: ${todoItem.title}"); // Debugging log

              // Add to completed list
              completedTodoNotifier.addToCompleted(
                  todoItem.title, todoItem.description, true);

              // Remove from active todo list
              todoNotifier.removeTodo(index);

              print(
                  "✅ Completed todos count after update: ${ref.read(completedtodoNotifierProvider).length}");
            }

            return SizedBox(
              height: 80,
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Checkbox(
                        side: const BorderSide(color: Colors.amber, width: 2),
                        value: todoList.isCompleted,
                        onChanged: (bool? value) {
                          switchToCompleted(
                              index, ref); // Pass `ref` to modify providers
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            todoList.title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              todoList.description,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      timeInString,
                      style: const TextStyle(color: Colors.red),
                    ),
                    IconButton(
                        onPressed: () {
                          todo.removeTodo(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.amber,
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
