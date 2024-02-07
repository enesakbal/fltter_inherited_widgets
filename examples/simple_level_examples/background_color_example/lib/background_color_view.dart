import 'dart:math';

import 'package:background_color_example/background.dart';
import 'package:flutter/material.dart';

class BackgroundColorView extends StatelessWidget {
  const BackgroundColorView({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Background.of(context).color;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text('Inherited Widget Example')),
      body: const Center(child: Text('Random Background Color')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final provider = Background.of(context);
          provider.changeColor(Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));

          //   random color func
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
