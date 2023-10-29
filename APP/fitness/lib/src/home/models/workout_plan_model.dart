// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WorkoutPlanModel {
  String id;
  String author;
  String title;
  bool fromFirebase;
  String url;
  String type;
  String days;
  WorkoutPlanModel({
    required this.id,
    required this.author,
    required this.title,
    required this.fromFirebase,
    required this.url,
    required this.type,
    required this.days,
  });

  WorkoutPlanModel copyWith({
    String? id,
    String? author,
    String? title,
    bool? fromFirebase,
    String? url,
    String? type,
    String? days,
  }) {
    return WorkoutPlanModel(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      fromFirebase: fromFirebase ?? this.fromFirebase,
      url: url ?? this.url,
      type: type ?? this.type,
      days: days ?? this.days,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'title': title,
      'fromFirebase': fromFirebase,
      'url': url,
      'type': type,
      'days': days,
    };
  }

  factory WorkoutPlanModel.fromMap(Map<String, dynamic> map) {
    return WorkoutPlanModel(
      id: map['id'] as String,
      author: map['author'] as String,
      title: map['title'] as String,
      fromFirebase: map['fromFirebase'] as bool,
      url: map['url'] as String,
      type: map['type'] as String,
      days: map['days'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutPlanModel.fromJson(String source) =>
      WorkoutPlanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorkoutPlanModel(id: $id, author: $author, title: $title, fromFirebase: $fromFirebase, url: $url, type: $type, days: $days)';
  }

  @override
  bool operator ==(covariant WorkoutPlanModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.author == author &&
        other.title == title &&
        other.fromFirebase == fromFirebase &&
        other.url == url &&
        other.type == type &&
        other.days == days;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        author.hashCode ^
        title.hashCode ^
        fromFirebase.hashCode ^
        url.hashCode ^
        type.hashCode ^
        days.hashCode;
  }
}
