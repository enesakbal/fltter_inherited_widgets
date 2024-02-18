import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/states/character_state.dart';
import 'package:rick_and_morty_app/src/widgets/home_app_bar.dart';
import 'package:rick_and_morty_app/src/widgets/home_search_bar.dart';

part '../widgets/character_listings_widget.dart';

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
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: HomeSearchBar(
              onChanged: (text) {
                if (_debounce.isActive) _debounce.cancel();

                _debounce = Timer(const Duration(seconds: 1), () {
                  CharacterState.of(context).fetchFilteredCharacters(name: text);
                });
              },
            ),
          ),
          const Expanded(child: _CharacterListingsWidget()),
        ],
      ),
    );
  }
}
