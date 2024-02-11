import 'package:background_color_example/app.dart';
import 'package:counter_example/app.dart';
import 'package:flutter/material.dart';
import 'package:form_example/app.dart';

class SimpleLevelView extends StatelessWidget {
  const SimpleLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    final examples = [
      const CounterApp(),
      const BackgroundColorApp(),
      const FormApp(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Level Examples',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: examples.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(examples[index].toStringShort()),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => examples[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
