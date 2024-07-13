import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'sampling_value_entity.dart';

class SamplingEntity {
  final int? id;
  final String dataUuid;
  final DateTime dataTimestamp;
  final List<SamplingValueEntity> values;

  SamplingEntity({
    this.id,
    required this.dataUuid,
    required this.dataTimestamp,
    required this.values,
  });

  SamplingEntity copyWith({
    int? id,
    String? dataUuid,
    DateTime? dataTimestamp,
    List<SamplingValueEntity>? values,
  }) {
    return SamplingEntity(
      id: id ?? this.id,
      dataUuid: dataUuid ?? this.dataUuid,
      dataTimestamp: dataTimestamp ?? this.dataTimestamp,
      values: values ?? this.values,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataUuid': dataUuid,
      'dataTimestamp': dataTimestamp.toIso8601String(),
      'values': values.map((x) => x.toMap()).toList(),
    };
  }

  factory SamplingEntity.fromMap(Map<String, dynamic> map) {
    return SamplingEntity(
      id: map['id'] != null ? map['id'] as int : null,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String).toLocal(),
      values: List<SamplingValueEntity>.from(
        (map['values'] as List<dynamic>).map<SamplingValueEntity>(
          (x) => SamplingValueEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SamplingEntity.fromJson(String source) =>
      SamplingEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SampingEntity(id: $id, dataUuid: $dataUuid, dataTimestamp: $dataTimestamp, values: $values)';
  }

  @override
  bool operator ==(covariant SamplingEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dataUuid == dataUuid &&
        other.dataTimestamp == dataTimestamp &&
        listEquals(other.values, values);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dataUuid.hashCode ^
        dataTimestamp.hashCode ^
        values.hashCode;
  }
}
