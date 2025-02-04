import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timecontroller.g.dart';

@riverpod
class TimeNotifier extends _$TimeNotifier {
  @override
  TimeOfDay build() {
    return TimeOfDay.now();
  }

  Future<void> toggleTime(Future<TimeOfDay?> time) async {
    state = await time ?? TimeOfDay.now();
  }

  void resetTime(TimeOfDay time) {
    state = time;
  }
}
