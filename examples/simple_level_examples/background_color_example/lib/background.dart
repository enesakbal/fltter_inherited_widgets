import 'package:flutter/material.dart';

class Background extends InheritedWidget {
  final Color color;
  final Function(Color color) changeColor;

  const Background({
    super.key,
    required super.child,
    required this.color,
    required this.changeColor,
  });

  static Background of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Background>()!;
  }

  @override
  bool updateShouldNotify(covariant Background oldWidget) {
    return oldWidget.color != color;
  }
}
