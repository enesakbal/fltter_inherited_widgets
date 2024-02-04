import 'dart:developer';

import 'package:fltter_inherited_widgets/simple_examples/counter_example/counter.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    log('called CounterView build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Widget Example'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            CounterText(),
          ],
        ),
      ),
      floatingActionButton: const IncrementButton(),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Counter.of(context);
    return Text('${provider.counter}');
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Counter.of(context);
    return FloatingActionButton(
      onPressed: counter.increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
