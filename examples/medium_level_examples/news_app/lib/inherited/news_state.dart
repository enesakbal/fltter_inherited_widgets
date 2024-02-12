import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class NewsState extends InheritedWidget {
  NewsState(
    this._fetchNews,
    this._toogleBookmark, {
    required this.newsList,
    required this.bookmarkedNewsList,
    super.key,
    required super.child,
  }) {
    homeScrollController = ScrollController();

    homeScrollController.addListener(_scrollListener);
  }

  final List<Article> newsList;
  final List<Article> bookmarkedNewsList;

  final VoidCallback _fetchNews;
  final ValueSetter<Article> _toogleBookmark;
  late final ScrollController homeScrollController;

  void _scrollListener() async {
    final isBottom = homeScrollController.position.maxScrollExtent == homeScrollController.offset &&
        homeScrollController.position.pixels == homeScrollController.position.maxScrollExtent;

    if (isBottom) {
      _fetchNews.call();
    }
  }

  void toogleBookmark(Article news) {
    _toogleBookmark.call(news);
  }

  static NewsState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewsState>();
  }

  @override
  bool updateShouldNotify(covariant NewsState oldWidget) {
    return (newsList != oldWidget.newsList || bookmarkedNewsList != oldWidget.bookmarkedNewsList);
  }
}
