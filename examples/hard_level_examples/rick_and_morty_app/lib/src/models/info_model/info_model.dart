import 'dart:convert';

class InfoModel {
  final String? count;
  final String? pages;
  final String? next;
  final String? prev;

  InfoModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      count: map['count'] != null ? map['count'] as String : null,
      pages: map['pages'] != null ? map['pages'] as String : null,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }

  factory InfoModel.fromJson(String source) => InfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(covariant InfoModel other) {
    if (identical(this, other)) return true;

    return other.count == count && other.pages == pages && other.next == next && other.prev == prev;
  }

  @override
  int get hashCode {
    return count.hashCode ^ pages.hashCode ^ next.hashCode ^ prev.hashCode;
  }
}
