import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rick_and_morty_app/src/models/character_model/character_location_model.dart';

class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  CharacterLocationModel? origin;
  CharacterLocationModel? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> data) {
    return CharacterModel(
      id: data['id'] as int?,
      name: data['name'] as String?,
      status: data['status'] as String?,
      species: data['species'] as String?,
      type: data['type'] as String?,
      gender: data['gender'] as String?,
      origin: data['origin'] == null ? null : CharacterLocationModel.fromMap(data['origin'] as Map<String, dynamic>),
      location: data['locationModel'] == null
          ? null
          : CharacterLocationModel.fromMap(data['locationModel'] as Map<String, dynamic>),
      image: data['image'] as String?,
      episode: data['episode'] as List<String>?,
      url: data['url'] as String?,
      created: data['created'] == null ? null : DateTime.parse(data['created'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': origin?.toMap(),
        'locationModel': location?.toMap(),
        'image': image,
        'episode': episode,
        'url': url,
        'created': created?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterModel].
  factory CharacterModel.fromJson(String data) {
    return CharacterModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CharacterModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      status.hashCode ^
      species.hashCode ^
      type.hashCode ^
      gender.hashCode ^
      origin.hashCode ^
      location.hashCode ^
      image.hashCode ^
      episode.hashCode ^
      url.hashCode ^
      created.hashCode;
}
