import 'dart:developer';

import 'package:rick_and_morty_app/src/core/app_constants.dart';
import 'package:rick_and_morty_app/src/core/network/network_manager.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_listings_model.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';
import 'package:rick_and_morty_app/src/service/character/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final NetworkManager _networkManager;

  CharacterRepositoryImpl(this._networkManager);

  @override
  Future<CharacterModel?> getCharacter(int? id) async {
    try {
      final response = await _networkManager.get('${AppConstants.charactersPath}/$id');
      return CharacterModel.fromMap(response.data as Map<String, dynamic>);
    } catch (e) {
      log('error: $e');
      return null;
    }
  }

  @override
  Future<CharacterListingsModel?> getCharacters() async {
    try {
      final response = await _networkManager.get(AppConstants.charactersPath);
      return CharacterListingsModel.fromMap(response.data as Map<String, dynamic>);
    } catch (e) {
      log('error: $e');
      return null;
    }
  }

  @override
  Future<CharacterListingsModel?> getFilteredCharacter({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    try {
      final response = await _networkManager.get(
        AppConstants.charactersPath,
        queryParameters: {
          'name': name,
          'status': status,
          'species': species,
          'type ': type,
        },
      );

      return CharacterListingsModel.fromMap(response.data as Map<String, dynamic>);
    } catch (e) {
      log('error: $e');
      return null;
    }
  }

  @override
  Future<CharacterListingsModel?> getMultiCharacter(List<int>? ids) async {
    try {
      final response = await _networkManager.get('${AppConstants.charactersPath}/${ids?.join(',')}');

      return CharacterListingsModel.fromMap(response.data as Map<String, dynamic>);
    } catch (e) {
      log('error: $e');
      return null;
    }
  }

  @override
  Future<CharacterListingsModel?> nextPage(String url) async {
    try {
      final response = await _networkManager.get(url);

      return CharacterListingsModel.fromMap(response.data as Map<String, dynamic>);
    } catch (e) {
      log('error: $e');
      return null;
    }
  }
}
