import 'dart:convert';

import 'package:flutter/material.dart';

import 'source.dart';

@immutable
class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromMap(Map<String, dynamic> data) => Article(
        source: data['source'] == null ? null : Source.fromMap(data['source'] as Map<String, dynamic>),
        author: data['author'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        url: data['url'] as String?,
        urlToImage: data['urlToImage'] as String?,
        publishedAt: data['publishedAt'] as String?,
        content: data['content'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'source': source?.toMap(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Article].
  factory Article.fromJson(String data) {
    return Article.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Article] to a JSON string.
  String toJson() => json.encode(toMap());
}
