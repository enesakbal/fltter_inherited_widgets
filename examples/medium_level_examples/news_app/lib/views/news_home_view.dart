import 'package:flutter/material.dart';
import 'package:news_app/inherited/news_state.dart';

class NewsHomeView extends StatelessWidget {
  const NewsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        elevation: 5,
        backgroundColor: Colors.blueAccent.withOpacity(0.4),
      ),
      body: ListView(
        shrinkWrap: true,
        controller: NewsState.of(context)?.homeScrollController,
        children: const [
          _NewsList(),
          SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList();

  @override
  Widget build(BuildContext context) {
    final newsList = NewsState.of(context)?.newsList ?? [];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: newsList.length,
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final news = newsList[index];
        return ListTile(
          title: Text(news.title ?? ''),
          subtitle: Text(news.description ?? ''),
          leading: news.urlToImage == null
              ? null
              : Image.network(
                  news.urlToImage ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
          onTap: () => NewsState.of(context)?.toogleBookmark(news),
        );
      },
    );
  }
}
