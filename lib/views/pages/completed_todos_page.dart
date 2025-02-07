import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/controller/completedcontroller.dart';
import 'package:todo/views/widgets/bottom_bar.dart';

class CompletedTodosPage extends HookConsumerWidget {
  const CompletedTodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodos = ref.watch(completedtodoNotifierProvider);
    final completedTodo = ref.read(completedtodoNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 20, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 20, 37),
        title: const Text(
          "Completed Todos",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
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
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        todo.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 6),
                      child: Text(
                        todo.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          completedTodo.deleteTodo(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.amber,
                        )),
                    visualDensity: const VisualDensity(vertical: 1),
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
