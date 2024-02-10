import 'package:cat_app/model/cat_model.dart';
import 'package:flutter/material.dart';

class CatApiState extends InheritedWidget {
  CatApiState({
    required super.child,
    required this.catList,
    required this.fetchCats,
    super.key,
  }) {
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  final List<CatModel> catList;
  final VoidCallback fetchCats;

  late final ScrollController scrollController;

  void _scrollListener() async {
    final isBottom = scrollController.position.maxScrollExtent == scrollController.offset &&
        scrollController.position.pixels == scrollController.position.maxScrollExtent;

    if (isBottom) {
      fetchCats.call();
    }
  }

  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
  }

  static CatApiState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CatApiState>();
  }

  @override
  bool updateShouldNotify(covariant CatApiState oldWidget) {
    return oldWidget.catList != catList;
  }
}
