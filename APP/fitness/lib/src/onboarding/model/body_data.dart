// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class BodyDataModel {
  final double bmi;
  final double bmi_high;
  final double bmi_low;
  final double carbs;
  final double fat;
  final double protein;
  final int gain_weight_calories;
  final int lose_weight_calories;
  final int maintain_weight_calories;
  final double ideal_weight;
  final int maintain_lose_gain;

  BodyDataModel({
    required this.bmi,
    required this.bmi_high,
    required this.bmi_low,
    required this.carbs,
    required this.fat,
    required this.protein,
    required this.gain_weight_calories,
    required this.lose_weight_calories,
    required this.maintain_weight_calories,
    required this.ideal_weight,
    required this.maintain_lose_gain,
  });

  BodyDataModel copyWith({
    double? bmi,
    double? bmi_high,
    double? bmi_low,
    double? carbs,
    double? fat,
    double? protein,
    int? gain_weight_calories,
    int? lose_weight_calories,
    int? maintain_weight_calories,
    double? ideal_weight,
    int? maintain_lose_gain,
  }) {
    return BodyDataModel(
      bmi: bmi ?? this.bmi,
      bmi_high: bmi_high ?? this.bmi_high,
      bmi_low: bmi_low ?? this.bmi_low,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      protein: protein ?? this.protein,
      gain_weight_calories: gain_weight_calories ?? this.gain_weight_calories,
      lose_weight_calories: lose_weight_calories ?? this.lose_weight_calories,
      maintain_weight_calories:
          maintain_weight_calories ?? this.maintain_weight_calories,
      ideal_weight: ideal_weight ?? this.ideal_weight,
      maintain_lose_gain: maintain_lose_gain ?? this.maintain_lose_gain,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bmi': bmi,
      'bmi_high': bmi_high,
      'bmi_low': bmi_low,
      'carbs': carbs,
      'fat': fat,
      'protein': protein,
      'gain_weight_calories': gain_weight_calories,
      'lose_weight_calories': lose_weight_calories,
      'maintain_weight_calories': maintain_weight_calories,
      'ideal_weight': ideal_weight,
      'maintain_lose_gain': maintain_lose_gain,
    };
  }

  factory BodyDataModel.fromMap(Map<String, dynamic> map) {
    return BodyDataModel(
      bmi: map['bmi'] as double,
      bmi_high: map['bmi_high'] as double,
      bmi_low: map['bmi_low'] as double,
      carbs: map['carbs'] as double,
      fat: map['fat'] as double,
      protein: map['protein'] as double,
      gain_weight_calories: map['gain_weight_calories'] as int,
      lose_weight_calories: map['lose_weight_calories'] as int,
      maintain_weight_calories: map['maintain_weight_calories'] as int,
      ideal_weight: map['ideal_weight'] as double,
      maintain_lose_gain: map['maintain_lose_gain'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BodyDataModel.fromJson(String source) =>
      BodyDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BodyDataModel(bmi: $bmi, bmi_high: $bmi_high, bmi_low: $bmi_low, carbs: $carbs, fat: $fat, protein: $protein, gain_weight_calories: $gain_weight_calories, lose_weight_calories: $lose_weight_calories, maintain_weight_calories: $maintain_weight_calories, ideal_weight: $ideal_weight, maintain_lose_gain: $maintain_lose_gain)';
  }

  @override
  bool operator ==(covariant BodyDataModel other) {
    if (identical(this, other)) return true;

    return other.bmi == bmi &&
        other.bmi_high == bmi_high &&
        other.bmi_low == bmi_low &&
        other.carbs == carbs &&
        other.fat == fat &&
        other.protein == protein &&
        other.gain_weight_calories == gain_weight_calories &&
        other.lose_weight_calories == lose_weight_calories &&
        other.maintain_weight_calories == maintain_weight_calories &&
        other.ideal_weight == ideal_weight &&
        other.maintain_lose_gain == maintain_lose_gain;
  }

  @override
  int get hashCode {
    return bmi.hashCode ^
        bmi_high.hashCode ^
        bmi_low.hashCode ^
        carbs.hashCode ^
        fat.hashCode ^
        protein.hashCode ^
        gain_weight_calories.hashCode ^
        lose_weight_calories.hashCode ^
        maintain_weight_calories.hashCode ^
        ideal_weight.hashCode ^
        maintain_lose_gain.hashCode;
  }
}
