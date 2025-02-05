import 'package:flutter/material.dart';
import 'package:todo/views/pages/completed_todos_page.dart';
import 'package:todo/views/pages/homepage.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.today_rounded,
                size: 30,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CompletedTodosPage()),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.done_outline_rounded,
                size: 30,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
