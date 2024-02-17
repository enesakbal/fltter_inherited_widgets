import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/network/network_manager.dart';
import 'package:rick_and_morty_app/src/inheriteds/character_provider.dart';
import 'package:rick_and_morty_app/src/service/character/character_repository_impl.dart';
import 'package:rick_and_morty_app/src/theme/app_theme.dart';
import 'package:rick_and_morty_app/src/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final characterService = CharacterRepositoryImpl(NetworkManager());

    return MaterialApp(
      title: 'Rick And Morty App',
      theme: AppTheme.darkTheme,
      home: CharacterProvider(
        characterService: characterService,
        child: const HomeView(),
      ),
    );
  }
}
