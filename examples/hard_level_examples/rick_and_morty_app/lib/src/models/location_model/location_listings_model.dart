import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/src/models/info_model/info_model.dart';
import 'package:rick_and_morty_app/src/models/location_model/location_model.dart';

class LocationListingsModel {
  final InfoModel? info;
  final List<LocationModel>? results;
  
  LocationListingsModel({
    this.info,
    this.results,
  });

  LocationListingsModel copyWith({
    InfoModel? info,
    List<LocationModel>? results,
  }) {
    return LocationListingsModel(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  factory LocationListingsModel.fromMap(Map<String, dynamic> map) {
    return LocationListingsModel(
      info: map['info'] != null ? InfoModel.fromMap(map['info'] as Map<String, dynamic>) : null,
      results: map['results'] != null
          ? List<LocationModel>.from(
              (map['results'] as List<int>).map<LocationModel?>(
                (x) => LocationModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory LocationListingsModel.fromJson(String source) =>
      LocationListingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocationListingsModel(info: $info, results: $results)';

  @override
  bool operator ==(covariant LocationListingsModel other) {
    if (identical(this, other)) return true;

    return other.info == info && listEquals(other.results, results);
  }

  @override
  int get hashCode => info.hashCode ^ results.hashCode;
}
