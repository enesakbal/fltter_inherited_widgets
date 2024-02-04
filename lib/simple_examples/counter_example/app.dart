import 'package:fltter_inherited_widgets/simple_examples/counter_example/counter_provider.dart';
import 'package:fltter_inherited_widgets/simple_examples/counter_example/counter_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const CounterApp(),
  );
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterProvider(
        child: CounterView(),
      ),
    );
  }
}
