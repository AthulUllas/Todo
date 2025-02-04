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
            return ListTile(
              title: Text(todoList.title),
              subtitle: Text(todoList.description),
            );
          }),
    );
  }
}
