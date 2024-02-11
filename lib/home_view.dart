import 'package:fltter_inherited_widgets/tabs/medium_level_view.dart';
import 'package:fltter_inherited_widgets/tabs/simple_level_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final _widgetOptions = <Widget>[
    const SimpleLevelView(),
    const MediumLevelView(),
    const Text('Profile Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Simple Level',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Medium Level',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Hard Level',
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
    );
  }
}
