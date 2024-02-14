import 'package:rick_and_morty_app/src/models/character_model/character_listings_model.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';

abstract class CharacterRepository {
  Future<CharacterListingsModel> nextPage(String url);

  Future<CharacterListingsModel> getCharacters();

  Future<CharacterModel?> getCharacter(int? id);

  Future<CharacterListingsModel?> getMultiCharacter(List<int>? ids);

  Future<CharacterListingsModel?> getFilteredCharacter({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  });
}
