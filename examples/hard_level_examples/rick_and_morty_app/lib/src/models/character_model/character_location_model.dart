import 'dart:convert';

import 'package:collection/collection.dart';

class CharacterLocationModel {
  String? name;
  String? url;

  CharacterLocationModel({this.name, this.url});

  factory CharacterLocationModel.fromMap(Map<String, dynamic> data) => CharacterLocationModel(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LocationModel].
  factory CharacterLocationModel.fromJson(String data) {
    return CharacterLocationModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LocationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CharacterLocationModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
