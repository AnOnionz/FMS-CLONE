import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/utilities/parser.dart';
import 'package:isar/isar.dart';

part 'crawl_quantity_entity.g.dart';

@collection
class CrwalQuantityEntity {
  Id get isarId => fastHash(dataUuid);
  final int? id;
  final String dataUuid;
  final int? featureId;
  final int? attendanceId;
  final DateTime dataTimestamp;
  final List<CrwaQuantitylValueEntity> values;
  @Enumerated(EnumType.name)
  final SyncStatus status;

  CrwalQuantityEntity(
      {required this.id,
      required this.dataUuid,
      this.featureId,
      this.attendanceId,
      required this.dataTimestamp,
      required this.values,
      this.status = SyncStatus.noSynced});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataUuid': dataUuid,
      'dataTimestamp': dataTimestamp.toUtc().toIso8601String(),
      'values': values.map((x) => x.toMap()).toList(),
    };
  }

  factory CrwalQuantityEntity.fromMap(Map<String, dynamic> map) {
    return CrwalQuantityEntity(
        id: map['id'] != null ? map['id'] as int : null,
        dataUuid: map['dataUuid'] as String,
        dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
        values: List<CrwaQuantitylValueEntity>.from(
          (map['values'] as List<int>).map<CrwaQuantitylValueEntity>(
            (x) => CrwaQuantitylValueEntity.fromMap(x as Map<String, dynamic>),
          ),
        ),
        status: SyncStatus.synced);
  }

  String toJson() => json.encode(toMap());

  factory CrwalQuantityEntity.fromJson(String source) =>
      CrwalQuantityEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  CrwalQuantityEntity copyWith({
    int? id,
    List<CrwaQuantitylValueEntity>? values,
    int? featureId,
    int? attendanceId,
    SyncStatus? status,
  }) {
    return CrwalQuantityEntity(
      id: id ?? this.id,
      dataUuid: dataUuid,
      dataTimestamp: dataTimestamp,
      featureId: featureId ?? this.featureId,
      attendanceId: attendanceId ?? this.attendanceId,
      status: status ?? this.status,
      values: values ?? this.values,
    );
  }

  @override
  String toString() {
    return 'CrwalQuantityEntity(id: $id, dataUuid: $dataUuid, featureId: $featureId, attendanceId: $attendanceId, dataTimestamp: $dataTimestamp, values: $values, status: $status)';
  }
}

@embedded
class CrwaQuantitylValueEntity {
  int? id;
  int? featureQuantityId;
  int? value;

  CrwaQuantitylValueEntity({
    this.id,
    this.featureQuantityId,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'featureQuantityId': featureQuantityId,
      'value': value,
    };
  }

  factory CrwaQuantitylValueEntity.fromMap(Map<String, dynamic> map) {
    return CrwaQuantitylValueEntity(
      id: map['id'] != null ? map['id'] as int : null,
      featureQuantityId: map['featureQuantityId'] != null
          ? map['featureQuantityId'] as int
          : null,
      value: map['value'] != null ? map['value'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CrwaQuantitylValueEntity.fromJson(String source) =>
      CrwaQuantitylValueEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CrwaQuantitylValueEntity(id: $id, featureQuantityId: $featureQuantityId, value: $value)';
}
