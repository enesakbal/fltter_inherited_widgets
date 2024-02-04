import 'package:fltter_inherited_widgets/simple_examples/counter_example/counter_service.dart';
import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  final CounterService counterService;
  const CounterInheritedWidget({
    super.key,
    required super.child,
    required this.counterService,
  });

  static CounterInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant CounterInheritedWidget oldWidget) {
    return true;
  }
}
