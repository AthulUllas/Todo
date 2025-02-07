import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/controller/completedcontroller.dart';
import 'package:todo/views/widgets/bottom_bar.dart';

class CompletedTodosPage extends HookConsumerWidget {
  const CompletedTodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodos = ref.watch(completedtodoNotifierProvider);

    print("✅ UI Rebuilding. Completed todos count: ${completedTodos.length}");

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 20, 37),
      body: completedTodos.isEmpty
          ? const Center(
              child: Text(
                "No completed todos yet!",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: completedTodos.length,
              itemBuilder: (context, index) {
                final todo = completedTodos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    todo.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: BottomBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
