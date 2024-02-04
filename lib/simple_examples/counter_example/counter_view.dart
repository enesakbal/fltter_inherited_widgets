import 'package:fltter_inherited_widgets/simple_examples/counter_example/counter_inherited_widget.dart';
import 'package:fltter_inherited_widgets/simple_examples/counter_example/counter_service.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final xxx = CounterService();

    return CounterInheritedWidget(
      counterService: xxx,
      child: Builder(builder: (context) {
        final counterService = CounterInheritedWidget.of(context).counterService;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter Example'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Builder(
                  builder: (context) {
                    print('object');
                    return Text(
                      '${counterService.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                CounterInheritedWidget.of(context).counterService.increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }),
        );
      }),
    );
  }
}
