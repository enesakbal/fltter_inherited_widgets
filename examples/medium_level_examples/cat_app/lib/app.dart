import 'package:cat_app/inherited/cat_api_provider.dart';
import 'package:cat_app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CatApiProvider(
        child: HomeView(),
      ),
    );
  }
}
