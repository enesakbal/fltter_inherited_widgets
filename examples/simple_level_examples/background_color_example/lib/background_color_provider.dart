import 'package:background_color_example/background.dart';
import 'package:flutter/material.dart';

class BackgroundColorProvider extends StatefulWidget {
  const BackgroundColorProvider({super.key, required this.child});

  final Widget child;

  @override
  State<BackgroundColorProvider> createState() => _BackgroundColorProviderState();
}

class _BackgroundColorProviderState extends State<BackgroundColorProvider> {
  late Color color;

  @override
  void initState() {
    color = Colors.blue;
    super.initState();
  }

  changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      color: color,
      changeColor: changeColor,
      child: widget.child,
    );
  }
}
