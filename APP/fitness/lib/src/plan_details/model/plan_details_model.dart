// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class PlanDetailsModel {
  String title;
  String author;
  String type;
  Map<String, dynamic> exercises;
  PlanDetailsModel({
    required this.title,
    required this.author,
    required this.type,
    required this.exercises,
  });

  PlanDetailsModel copyWith({
    String? title,
    String? author,
    String? type,
    Map<String, dynamic>? exercises,
  }) {
    return PlanDetailsModel(
      title: title ?? this.title,
      author: author ?? this.author,
      type: type ?? this.type,
      exercises: exercises ?? this.exercises,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'type': type,
      'exercises': exercises,
    };
  }

  factory PlanDetailsModel.fromMap(Map<String, dynamic> map) {
    return PlanDetailsModel(
        title: map['title'] as String,
        author: map['author'] as String,
        type: map['type'] as String,
        exercises: Map<String, dynamic>.from(
          (map['exercises'] as Map<String, dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory PlanDetailsModel.fromJson(String source) =>
      PlanDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlanDetailsModel(title: $title, author: $author, type: $type, exercises: $exercises)';
  }

  @override
  bool operator ==(covariant PlanDetailsModel other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.title == title &&
        other.author == author &&
        other.type == type &&
        mapEquals(other.exercises, exercises);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        author.hashCode ^
        type.hashCode ^
        exercises.hashCode;
  }
}
