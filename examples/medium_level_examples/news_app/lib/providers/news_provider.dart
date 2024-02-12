import 'package:flutter/material.dart';
import 'package:news_app/inherited/news_state.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/service/news_api_service.dart';

class NewsProvider extends StatefulWidget {
  const NewsProvider({super.key, required this.child});

  final Widget child;

  @override
  State<NewsProvider> createState() => _NewsProviderState();
}

class _NewsProviderState extends State<NewsProvider> {
  late final NewsApiService _newsApiService;

  late List<Article> _newsList;
  late List<Article> _bookmarkedNewsList;

  @override
  void initState() {
    _newsApiService = NewsApiService();

    _newsList = [];
    _bookmarkedNewsList = [];

    fetchNews();

    super.initState();
  }

  void fetchNews() async {
    final newsResponse = await _newsApiService.getPopularNews();
    setState(() {
      _newsList = List.from(_newsList..addAll(newsResponse.articles ?? []));
    });
  }

  void toogleBookmark(Article news) {
    if (_bookmarkedNewsList.contains(news)) {
      setState(() {
        _bookmarkedNewsList = List.from(_bookmarkedNewsList..remove(news));
      });
    } else {
      setState(() {
        _bookmarkedNewsList = List.from(_bookmarkedNewsList..add(news));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NewsState(
      fetchNews,
      toogleBookmark,
      newsList: _newsList,
      bookmarkedNewsList: _bookmarkedNewsList,
      child: widget.child,
    );
  }
}
