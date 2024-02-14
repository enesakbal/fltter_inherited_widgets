import 'dart:convert';

import 'package:collection/collection.dart';

class EpisodeModel {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  DateTime? created;

  EpisodeModel({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory EpisodeModel.fromMap(Map<String, dynamic> data) => EpisodeModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        airDate: data['air_date'] as String?,
        episode: data['episode'] as String?,
        characters: (data['characters'] as List<dynamic>?)?.map((e) => e as String).toList(),
        url: data['url'] as String?,
        created: data['created'] == null ? null : DateTime.parse(data['created'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'air_date': airDate,
        'episode': episode,
        'characters': characters,
        'url': url,
        'created': created?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EpisodeModel].
  factory EpisodeModel.fromJson(String data) {
    return EpisodeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EpisodeModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EpisodeModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      airDate.hashCode ^
      episode.hashCode ^
      characters.hashCode ^
      url.hashCode ^
      created.hashCode;
}
