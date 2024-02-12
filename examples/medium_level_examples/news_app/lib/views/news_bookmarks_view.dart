import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/inherited/news_state.dart';

class NewsBookmarksView extends StatelessWidget {
  const NewsBookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    log('NewsBookmarksView: build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: false,
        elevation: 5,
        backgroundColor: Colors.blueAccent.withOpacity(0.4),
      ),
      body: const _BookmarkList(),
    );
  }
}

class _BookmarkList extends StatelessWidget {
  const _BookmarkList();

  @override
  Widget build(BuildContext context) {
    final newsList = NewsState.of(context)?.bookmarkedNewsList ?? [];

    log('_BookmarkList: $newsList');
    return ListView.builder(
      itemCount: newsList.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final news = newsList[index];

        return ListTile(
          title: Text(news.title ?? ''),
          subtitle: Text(news.description ?? ''),
          leading: Image.network(news.urlToImage ?? ''),
          onTap: () => NewsState.of(context)?.toogleBookmark(news),
        );
      },
    );
  }
}
