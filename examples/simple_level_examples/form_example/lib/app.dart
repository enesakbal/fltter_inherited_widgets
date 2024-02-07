import 'package:flutter/material.dart';
import 'package:form_example/form_provider.dart';
import 'package:form_example/form_view.dart';

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
      home: FormProvider(child: FormView()),
    );
  }
}
