import 'package:fltter_inherited_widgets/simple_examples/background_color_example/background_color_provider.dart';
import 'package:fltter_inherited_widgets/simple_examples/background_color_example/background_color_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BackgroundColorApp());
}

class BackgroundColorApp extends StatelessWidget {
  const BackgroundColorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BackgroundColorProvider(
        child: BackgroundColorView(),
      ),
    );
  }
}
