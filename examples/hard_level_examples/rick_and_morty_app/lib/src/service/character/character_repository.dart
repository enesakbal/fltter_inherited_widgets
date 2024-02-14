import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getCharacters();

  Future<CharacterModel> getCharacter(int id);

  Future<List<CharacterModel>> getMultiCharacter(List<int> ids);

  Future<List<CharacterModel>> filterCharacter({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  });
}
