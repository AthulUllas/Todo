import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/controller/timecontroller.dart';
import 'package:todo/controller/todocontroller.dart';
import 'package:todo/views/widgets/todos.dart';

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeProvider = ref.watch(timeNotifierProvider);
    final time = ref.read(timeNotifierProvider.notifier);
    final todo = ref.read(todoNotifierProvider.notifier);
    final isClicked = useState(false);
    final titleController = useTextEditingController();
    final snackBar = SnackBar(
        duration: const Duration(milliseconds: 900),
        action: SnackBarAction(label: "OK", onPressed: () {}),
        content: const Text("Your todo is empty"));
    final descriptionController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 20, 37),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Todo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: isClicked.value ? 210 : 120,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 191, 0),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 26,
                      left: 16,
                      right: 16,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 0.7, color: Colors.red.shade900),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      controller: titleController,
                      cursorWidth: 1.5,
                      cursorHeight: 20,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.add_task_rounded,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (titleController.text.trim().isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else if (isClicked.value) {
                                  isClicked.value = isClicked.value;
                                } else {
                                  isClicked.value = !isClicked.value;
                                }
                              },
                              icon: const Icon(Icons.add)),
                          hintText: "Enter Task",
                          contentPadding:
                              const EdgeInsets.only(top: 12, left: 8)),
                    ),
                  ),
                  if (isClicked.value)
                    Container(
                      margin: const EdgeInsets.only(
                        top: 26,
                        left: 16,
                        right: 16,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.7, color: Colors.red.shade900),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        controller: descriptionController,
                        cursorWidth: 1.5,
                        cursorHeight: 20,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.description_outlined,
                              size: 20,
                            ),
                            hintText: "Description",
                            contentPadding:
                                const EdgeInsets.only(top: 12, left: 8),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  final selectedTime = showTimePicker(
                                      context: context,
                                      initialTime: timeProvider);
                                  time.toggleTime(selectedTime);
                                },
                                icon: const Icon(Icons.timer))),
                      ),
                    ),
                  if (isClicked.value)
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 22.0, bottom: 15),
                            child: InkWell(
                              onTap: () {
                                if (titleController.text.trim().isNotEmpty &&
                                    descriptionController.text
                                        .trim()
                                        .isNotEmpty) {
                                  todo.addTodo(
                                      titleController.text,
                                      descriptionController.text,
                                      timeProvider,
                                      false);
                                  titleController.clear();
                                  descriptionController.clear();
                                  time.resetTime(TimeOfDay.now());
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 25,
                                child: const Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 22.0, bottom: 18),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.notification_important_rounded,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(timeProvider.format(context)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const TodosList(),
          ],
        ),
      ),
    );
  }
}
