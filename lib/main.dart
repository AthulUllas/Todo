import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final selectedTimeProvider = StateProvider<TimeOfDay?>((ref) => null);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(selectedTimeProvider);
    final isClicked = useState(false);
    final textFieldController = useTextEditingController();
    final snackBar = SnackBar(
        duration: const Duration(milliseconds: 900),
        action: SnackBarAction(label: "OK", onPressed: () {}),
        content: const Text("Your todo is empty"));
    final descriptionController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: isClicked.value ? 200 : 120,
            decoration: BoxDecoration(
                color: Colors.amber[100],
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
                    controller: textFieldController,
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
                              if (textFieldController.text.trim().isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              //  else if (isClicked.value == true) {
                              //   isClicked.value == isClicked.value;
                              // }
                              else if (isClicked.value) {
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
                        border:
                            Border.all(width: 0.7, color: Colors.red.shade900),
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
                                final todoTime = showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                // ref.read(selectedTimeProvider.notifier).state =
                                //     todoTime;
                              },
                              icon: const Icon(Icons.timer))),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
