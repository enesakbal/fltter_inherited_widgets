import 'dart:convert';

import 'package:collection/collection.dart';

class LocationModel {
  String? name;
  String? url;

  LocationModel({this.name, this.url});

  factory LocationModel.fromMap(Map<String, dynamic> data) => LocationModel(
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
  int get hashCode => name.hashCode ^ url.hashCode;
}
