import 'package:cat_app/model/cat_model.dart';
import 'package:flutter/material.dart';

class CatApiState extends InheritedWidget {
  CatApiState({
    required super.child,
    required this.catList,
    required this.fetchCats,
    super.key,
  }) : scrollController = ScrollController();

  final ScrollController scrollController;
  final List<CatModel> catList;
  final VoidCallback fetchCats;

  static CatApiState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CatApiState>();
  }

  @override
  bool updateShouldNotify(covariant CatApiState oldWidget) {
    return oldWidget.catList != catList;
  }
}
