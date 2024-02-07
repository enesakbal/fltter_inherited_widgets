import 'dart:developer';

import 'package:counter_example/counter.dart';
import 'package:flutter/material.dart';

class CounterProvider extends StatefulWidget {
  const CounterProvider({super.key, required this.child});
  final Widget child;

  @override
  State<CounterProvider> createState() => _CounterProviderState();
}

class _CounterProviderState extends State<CounterProvider> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('called CounterProvider build');
    return Counter(
      counter: counter,
      increment: increment,
      child: widget.child,
    );
  }
}
