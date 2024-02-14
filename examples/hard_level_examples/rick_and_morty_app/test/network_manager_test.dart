import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/src/core/network/network_manager.dart';

void main() {
  final networkManager = NetworkManager();

  test('get character', () async {
    final response = await networkManager.get('https://rickandmortyapi.com/api/character/1');
    expect(response.statusCode, 200);
  });

  test('get characters', () async {
    final response = await networkManager.get('https://rickandmortyapi.com/api/character');
    expect(response.statusCode, 200);
  });
}
