import 'dart:convert';

import 'package:collection/collection.dart';

class LocationModel {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  DateTime? created;

  LocationModel({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  factory LocationModel.fromMap(Map<String, dynamic> data) => LocationModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        type: data['type'] as String?,
        dimension: data['dimension'] as String?,
        residents: data['residents'] as List<String>?,
        url: data['url'] as String?,
        created: data['created'] == null ? null : DateTime.parse(data['created'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'type': type,
        'dimension': dimension,
        'residents': residents,
        'url': url,
        'created': created?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LocationModel].
  factory LocationModel.fromJson(String data) {
    return LocationModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LocationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LocationModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      type.hashCode ^
      dimension.hashCode ^
      residents.hashCode ^
      url.hashCode ^
      created.hashCode;
}
