// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/data_entity.dart';
import 'sampling_value_entity.dart';

part 'sampling_entity.g.dart';

@collection
class SamplingEntity extends BaseEntity {
  Id get isarId => fastHash(keys.join('-'));
  final int? id;
  int? attendanceId;
  int? featureId;
  final String dataUuid;
  final DateTime dataTimestamp;
  final List<SamplingValueEntity> values;
  @Enumerated(EnumType.name)
  SyncStatus status;
  @Index(type: IndexType.value)
  List<int> get keys => [attendanceId!, featureId!];

  SamplingEntity(
      {this.id,
      this.attendanceId,
      this.featureId,
      required this.dataUuid,
      required this.dataTimestamp,
      required this.values,
      this.status = SyncStatus.isNoSynced});

  SamplingEntity copyWith({
    int? id,
    int? attendanceId,
    int? featureId,
    String? dataUuid,
    DateTime? dataTimestamp,
    List<SamplingValueEntity>? values,
    SyncStatus? status,
  }) {
    return SamplingEntity(
      id: id ?? this.id,
      attendanceId: attendanceId ?? this.attendanceId,
      featureId: featureId ?? this.featureId,
      dataUuid: dataUuid ?? this.dataUuid,
      dataTimestamp: dataTimestamp ?? this.dataTimestamp,
      values: values ?? this.values,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attendanceId': attendanceId,
      'featureId': featureId,
      'dataUuid': dataUuid,
      'dataTimestamp': dataTimestamp.toIso8601String(),
      'values': values.map((x) => x.toMap()).toList(),
    };
  }

  factory SamplingEntity.fromMap(Map<String, dynamic> map) {
    return SamplingEntity(
      id: map['id'] != null ? map['id'] as int : null,
      attendanceId:
          map['attendanceId'] != null ? map['attendanceId'] as int : null,
      featureId: map['featureId'] != null ? map['featureId'] as int : null,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
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
    return 'SamplingEntity(id: $id, attendanceId: $attendanceId, featureId: $featureId, dataUuid: $dataUuid, dataTimestamp: $dataTimestamp, values: $values, status: $status)';
  }

  @override
  bool operator ==(covariant SamplingEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.attendanceId == attendanceId &&
        other.featureId == featureId &&
        other.dataUuid == dataUuid &&
        other.dataTimestamp == dataTimestamp &&
        listEquals(other.values, values) &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        attendanceId.hashCode ^
        featureId.hashCode ^
        dataUuid.hashCode ^
        dataTimestamp.hashCode ^
        values.hashCode ^
        status.hashCode;
  }
}
