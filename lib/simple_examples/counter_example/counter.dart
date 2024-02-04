import 'dart:developer';

import 'package:flutter/material.dart';

class Counter extends InheritedWidget {
  final int counter;
  final VoidCallback increment;

  const Counter({
    super.key,
    required super.child,
    required this.counter,
    required this.increment,
  });

  static Counter of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Counter>()!;
  }

  @override
  bool updateShouldNotify(covariant Counter oldWidget) {
    log('called updateShouldNotify');
    return counter != oldWidget.counter;
  }
}
