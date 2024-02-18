import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';

class CharacterState extends InheritedWidget {
  CharacterState({
    super.key,
    required super.child,
    required this.characters,
    required this.fetchCharacters,
    required this.fetchNextPage,
    required this.fetchFilteredCharacters,
    required this.fetchMultiCharacters,
  }) {
    scrollController = ScrollController();

    scrollController.addListener(_scrollListener);
  }

  late final ScrollController scrollController;

  final List<CharacterModel> characters;

  final VoidCallback fetchCharacters;
  final VoidCallback fetchNextPage;
  final void Function(List<int>? ids) fetchMultiCharacters;
  final void Function({
    String? name,
    String? status,
    String? species,
    String? type,
  }) fetchFilteredCharacters;

  static CharacterState of(BuildContext context) {
    assert(context.dependOnInheritedWidgetOfExactType<CharacterState>() != null,
        'You need to wrap your widget with CharacterProvider');
    return context.dependOnInheritedWidgetOfExactType<CharacterState>()!;
  }

  void _scrollListener() async {
    final isBottom = scrollController.position.maxScrollExtent == scrollController.offset &&
        scrollController.position.pixels == scrollController.position.maxScrollExtent;

    if (isBottom) {
      fetchNextPage.call();
    }
  }

  @override
  bool updateShouldNotify(covariant CharacterState oldWidget) {
    return oldWidget.characters != characters;
  }
}
