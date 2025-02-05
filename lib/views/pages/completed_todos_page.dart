import 'package:flutter/material.dart';
import 'package:todo/views/widgets/bottom_bar.dart';

class CompletedTodosPage extends StatelessWidget {
  const CompletedTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return const ListTile(
          title: Text("Todo"),
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
