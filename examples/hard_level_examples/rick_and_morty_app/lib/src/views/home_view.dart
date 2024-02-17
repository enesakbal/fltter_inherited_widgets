import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/states/character_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Timer _debounce;

  @override
  void initState() {
    _debounce = Timer(const Duration(seconds: 1), () {
      CharacterState.of(context).fetchCharacters();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick And Morty App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: SearchBar(
              hintText: 'Search character',
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (text) {
                if (_debounce.isActive) _debounce.cancel();

                _debounce = Timer(const Duration(seconds: 1), () {
                  CharacterState.of(context).fetchFilteredCharacters(name: text);
                });
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: CharacterState.of(context).characters.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final character = CharacterState.of(context).characters[index];
                return ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  title: Text(character.name ?? ''),
                  subtitle: Text(character.status ?? ''),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(character.image ?? ''),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
