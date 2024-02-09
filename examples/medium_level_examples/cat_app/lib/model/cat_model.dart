import 'dart:convert';

import 'package:collection/collection.dart';

class CatModel {
  String? id;
  String? url;

  CatModel({this.id, this.url});

  factory CatModel.fromMap(Map<String, dynamic> data) => CatModel(
        id: data['id'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CatModel].
  factory CatModel.fromJson(String data) {
    return CatModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CatModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CatModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
