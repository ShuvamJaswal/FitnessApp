// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class ExerciseDetailsModel {
  String bodyPart;
  String equipment;
  String gifUrl;
  String id;
  List instructions;
  String name;
  List secondaryMuscles;
  String target;
  ExerciseDetailsModel({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.instructions,
    required this.name,
    required this.secondaryMuscles,
    required this.target,
  });

  ExerciseDetailsModel copyWith({
    String? bodyPart,
    String? equipment,
    String? gifUrl,
    String? id,
    List? instructions,
    String? name,
    List? secondaryMuscles,
    String? target,
  }) {
    return ExerciseDetailsModel(
      bodyPart: bodyPart ?? this.bodyPart,
      equipment: equipment ?? this.equipment,
      gifUrl: gifUrl ?? this.gifUrl,
      id: id ?? this.id,
      instructions: instructions ?? this.instructions,
      name: name ?? this.name,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
      target: target ?? this.target,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bodyPart': bodyPart,
      'equipment': equipment,
      'gifUrl': gifUrl,
      'id': id,
      'instructions': instructions,
      'name': name,
      'secondaryMuscles': secondaryMuscles,
      'target': target,
    };
  }

  factory ExerciseDetailsModel.fromMap(Map<String, dynamic> map) {
    return ExerciseDetailsModel(
      bodyPart: map['bodyPart'] as String,
      equipment: map['equipment'] as String,
      gifUrl: map['gifUrl'] as String,
      id: map['id'] as String,
      instructions: List.from(map['instructions'] as List),
      name: map['name'] as String,
      secondaryMuscles: List.from(map['secondaryMuscles'] as List),
      target: map['target'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseDetailsModel.fromJson(String source) =>
      ExerciseDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExerciseDetailsModel(bodyPart: $bodyPart, equipment: $equipment, gifUrl: $gifUrl, id: $id, instructions: $instructions, name: $name, secondaryMuscles: $secondaryMuscles, target: $target)';
  }

  @override
  bool operator ==(covariant ExerciseDetailsModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.bodyPart == bodyPart &&
        other.equipment == equipment &&
        other.gifUrl == gifUrl &&
        other.id == id &&
        listEquals(other.instructions, instructions) &&
        other.name == name &&
        listEquals(other.secondaryMuscles, secondaryMuscles) &&
        other.target == target;
  }

  @override
  int get hashCode {
    return bodyPart.hashCode ^
        equipment.hashCode ^
        gifUrl.hashCode ^
        id.hashCode ^
        instructions.hashCode ^
        name.hashCode ^
        secondaryMuscles.hashCode ^
        target.hashCode;
  }
}
