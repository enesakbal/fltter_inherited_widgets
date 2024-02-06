import 'package:fltter_inherited_widgets/simple_examples/form_example/form_provider.dart';
import 'package:fltter_inherited_widgets/simple_examples/form_example/form_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const FormApp(),
  );
}

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormProvider(
        child: FormView(),
      ),
    );
  }
}
