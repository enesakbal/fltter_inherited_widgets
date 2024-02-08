import 'dart:convert';

import 'package:collection/collection.dart';

class BreedModel {
  String? name;
  String? origin;
  String? description;
  String? wikipediaUrl;

  BreedModel({this.name, this.origin, this.description, this.wikipediaUrl});

  factory BreedModel.fromMap(Map<String, dynamic> data) => BreedModel(
        name: data['name'] as String?,
        origin: data['origin'] as String?,
        description: data['description'] as String?,
        wikipediaUrl: data['wikipedia_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'origin': origin,
        'description': description,
        'wikipedia_url': wikipediaUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BreedModel].
  factory BreedModel.fromJson(String data) {
    return BreedModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BreedModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BreedModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ origin.hashCode ^ description.hashCode ^ wikipediaUrl.hashCode;
}
