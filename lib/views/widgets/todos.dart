import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/controller/todocontroller.dart';

class TodosList extends HookConsumerWidget {
  const TodosList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);
    return Expanded(
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todoList = todos[index];
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: ListTile(
                title: Text(todoList.title),
                subtitle: Text(todoList.description),
                leading: const Icon(Icons.abc),
                trailing: const Icon(Icons.delete),
                selectedColor: Colors.white,
                iconColor: Colors.black,
                tileColor: Colors.amber[100],
              ),
            );
          }),
    );
  }
}
