import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';
import 'package:rick_and_morty_app/src/service/character/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Future<List<CharacterModel>> filterCharacter({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) {
    // TODO: implement filterCharacter
    throw UnimplementedError();
  }

  @override
  Future<CharacterModel> getCharacter(int id) {
    // TODO: implement getCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterModel>> getCharacters() {
    // TODO: implement getCharacters
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterModel>> getMultiCharacter(List<int> ids) {
    // TODO: implement getMultiCharacter
    throw UnimplementedError();
  }
}
