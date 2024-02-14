import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/src/models/episode_model/episode_model.dart';
import 'package:rick_and_morty_app/src/models/info_model/info_model.dart';

class EpisodeListingsModel {
  final InfoModel? info;
  final List<EpisodeModel>? results;

  EpisodeListingsModel({
    this.info,
    this.results,
  });

  EpisodeListingsModel copyWith({
    InfoModel? info,
    List<EpisodeModel>? results,
  }) {
    return EpisodeListingsModel(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  factory EpisodeListingsModel.fromMap(Map<String, dynamic> map) {
    return EpisodeListingsModel(
      info: map['info'] != null ? InfoModel.fromMap(map['info'] as Map<String, dynamic>) : null,
      results: map['results'] != null
          ? List<EpisodeModel>.from(
              (map['results'] as List<int>).map<EpisodeModel?>(
                (x) => EpisodeModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory EpisodeListingsModel.fromJson(String source) =>
      EpisodeListingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EpisodeListingsModel(info: $info, results: $results)';

  @override
  bool operator ==(covariant EpisodeListingsModel other) {
    if (identical(this, other)) return true;

    return other.info == info && listEquals(other.results, results);
  }

  @override
  int get hashCode => info.hashCode ^ results.hashCode;
}
