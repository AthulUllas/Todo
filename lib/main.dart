import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/views/pages/homepage.dart';

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
