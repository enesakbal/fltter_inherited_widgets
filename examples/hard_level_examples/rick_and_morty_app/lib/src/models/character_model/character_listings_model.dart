import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_model.dart';
import 'package:rick_and_morty_app/src/models/info_model/info_model.dart';

class CharacterListingsModel {
  final InfoModel? info;
  final List<CharacterModel>? results;

  CharacterListingsModel({
    this.info,
    this.results,
  });

  CharacterListingsModel copyWith({
    InfoModel? info,
    List<CharacterModel>? results,
  }) {
    return CharacterListingsModel(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  factory CharacterListingsModel.fromMap(Map<String, dynamic> map) {
    return CharacterListingsModel(
      info: map['info'] != null ? InfoModel.fromMap(map['info'] as Map<String, dynamic>) : null,
      results: map['results'] != null
          ? List<CharacterModel>.from(
              (map['results'] as List<dynamic>).map<CharacterModel?>(
                (x) => CharacterModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory CharacterListingsModel.fromJson(String source) =>
      CharacterListingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CharacterListingsModel(info: $info, results: $results)';

  @override
  bool operator ==(covariant CharacterListingsModel other) {
    if (identical(this, other)) return true;

    return other.info == info && listEquals(other.results, results);
  }

  @override
  int get hashCode => info.hashCode ^ results.hashCode;
}
