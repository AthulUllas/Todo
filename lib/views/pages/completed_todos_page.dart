import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/controller/completedcontroller.dart';
import 'package:todo/controller/todocontroller.dart';
import 'package:todo/views/widgets/bottom_bar.dart';

class CompletedTodosPage extends HookConsumerWidget {
  const CompletedTodosPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodo = ref.watch(completedtodoNotifierProvider);
    final completedTodos = ref.read(completedtodoNotifierProvider.notifier);
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return const ListTile(
          title: Text("todos"),
        );
      }),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: BottomBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
