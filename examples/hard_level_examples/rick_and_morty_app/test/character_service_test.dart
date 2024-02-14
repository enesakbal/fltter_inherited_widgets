import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/src/core/network/network_manager.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_listings_model.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';
import 'package:rick_and_morty_app/src/service/character/character_repository_impl.dart';

void main() {
  final networkManager = NetworkManager();

  final characterRepository = CharacterRepositoryImpl(networkManager);

  test('get characters service test', () async {
    final list = <CharacterListingsModel>[];
    final response = await characterRepository.getCharacters();

    list.add(response);

    final response2 = await characterRepository.nextPage(response.info!.next!);

    list.add(response2);

    expect(list.length, 2);
    expect(list.expand((element) => element.results?.toList() ?? []).toList().length, 40);
  });

  test('get character service test', () async {
    final response = await characterRepository.getCharacter(1);

    expect(response, isA<CharacterModel>());
    expect(response?.id, 1);
  });
}
