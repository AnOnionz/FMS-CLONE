import 'dart:convert';

class SamplingValueEntity {
  final int? id;
  final int? featureSamplingId;
  final double? conversionRate;
  final int? conversionValue;
  final int? value;

  SamplingValueEntity({
    this.id,
    this.featureSamplingId,
    this.conversionRate,
    this.conversionValue,
    this.value,
  });

  SamplingValueEntity copyWith({
    int? id,
    int? featureSamplingId,
    double? conversionRate,
    int? conversionValue,
    int? value,
  }) {
    return SamplingValueEntity(
      id: id ?? this.id,
      featureSamplingId: featureSamplingId ?? this.featureSamplingId,
      conversionRate: conversionRate ?? this.conversionRate,
      conversionValue: conversionValue ?? this.conversionValue,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'featureSamplingId': featureSamplingId,
      'value': value,
    };
  }

  factory SamplingValueEntity.fromMap(Map<String, dynamic> map) {
    return SamplingValueEntity(
      id: map['id'] != null ? map['id'] as int : null,
      featureSamplingId: map['featureSamplingId'] != null
          ? map['featureSamplingId'] as int
          : null,
      conversionRate: map['conversionRate'] != null
          ? map['conversionRate'] as double
          : null,
      conversionValue:
          map['conversionValue'] != null ? map['conversionValue'] as int : null,
      value: map['value'] != null ? map['value'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SamplingValueEntity.fromJson(String source) =>
      SamplingValueEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SampingValueEntity(id: $id, featureSamplingId: $featureSamplingId, conversionRate: $conversionRate, conversionValue: $conversionValue, value: $value)';
  }

  @override
  bool operator ==(covariant SamplingValueEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.featureSamplingId == featureSamplingId &&
        other.conversionRate == conversionRate &&
        other.conversionValue == conversionValue &&
        other.value == value;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        featureSamplingId.hashCode ^
        conversionRate.hashCode ^
        conversionValue.hashCode ^
        value.hashCode;
  }
}
