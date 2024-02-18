import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_listings_model.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';
import 'package:rick_and_morty_app/src/service/character/character_repository.dart';
import 'package:rick_and_morty_app/src/states/character_state.dart';

class CharacterProvider extends StatefulWidget {
  const CharacterProvider({
    super.key,
    required this.child,
    required this.characterService,
  });
  final Widget child;
  final CharacterRepository characterService;

  @override
  State<CharacterProvider> createState() => _CharacterProviderState();
}

class _CharacterProviderState extends State<CharacterProvider> {
  late List<CharacterModel> _characters;
  late CharacterListingsModel lastCharacters;

  @override
  void initState() {
    _characters = [];
    super.initState();
  }

  void fetchCharacters() async {
    final characters = await widget.characterService.getCharacters();
    _characters = List.from(_characters + (characters?.results ?? []));
    lastCharacters = characters ?? CharacterListingsModel();
    setState(() {});
  }

  void fetchNextPage() async {
    final characters = await widget.characterService.nextPage(lastCharacters.info?.next ?? '');

    _characters = List.from(_characters + (characters?.results ?? []));
    setState(() {});
  }

  void fetchFilteredCharacters({
    String? name,
    String? status,
    String? species,
    String? type,
  }) async {
    final characters = await widget.characterService.getFilteredCharacter(
      name: name,
      status: status,
      species: species,
      type: type,
    );

    _characters = List.from((characters?.results ?? []));
    setState(() {});
  }

  void fetchMultiCharacters(List<int>? ids) async {
    final characters = await widget.characterService.getMultiCharacter(ids);
    _characters = List.from((characters?.results ?? []));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CharacterState(
      characters: _characters,
      fetchCharacters: fetchCharacters,
      fetchNextPage: fetchNextPage,
      fetchFilteredCharacters: fetchFilteredCharacters,
      fetchMultiCharacters: fetchMultiCharacters,
      child: widget.child,
    );
  }
}
