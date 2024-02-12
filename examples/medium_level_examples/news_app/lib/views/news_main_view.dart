import 'package:flutter/material.dart';
import 'package:news_app/views/news_bookmarks_view.dart';
import 'package:news_app/views/news_home_view.dart';

class NewsMainView extends StatefulWidget {
  const NewsMainView({super.key});

  @override
  State<NewsMainView> createState() => _NewsMainViewState();
}

class _NewsMainViewState extends State<NewsMainView> {
  int currenIndex = 0;

  void changeIndex(int value) => setState(() => currenIndex = value);

  final List<Widget> _children = const [NewsHomeView(), NewsBookmarksView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Api Inherited')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
        ],
        currentIndex: currenIndex,
        onTap: changeIndex,
      ),
      body: _children[currenIndex],
    );
  }
}
