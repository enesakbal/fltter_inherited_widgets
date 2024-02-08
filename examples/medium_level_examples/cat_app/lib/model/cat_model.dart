import 'dart:convert';

import 'package:collection/collection.dart';

import 'breed_model.dart';

class CatModel {
  String? id;
  String? url;
  List<BreedModel>? breeds;

  CatModel({this.id, this.url, this.breeds});

  factory CatModel.fromMap(Map<String, dynamic> data) => CatModel(
        id: data['id'] as String?,
        url: data['url'] as String?,
        breeds: (data['breeds'] as List<dynamic>?)?.map((e) => BreedModel.fromMap(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'url': url,
        'breeds': breeds?.map((e) => e.toMap()).toList(),
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
  int get hashCode => id.hashCode ^ url.hashCode ^ breeds.hashCode;
}
