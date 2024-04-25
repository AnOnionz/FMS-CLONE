// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:isar/isar.dart';

part 'crawl_quantity_entity.g.dart';

@collection
class CrawlQuantityEntity extends DataEntity {
  Id get isarId => fastHash(dataUuid);
  final int? id;
  final String dataUuid;
  @Index(unique: true, replace: true)
  int? attendanceId;
  @Index(unique: true, replace: true)
  int? featureId;
  final DateTime dataTimestamp;
  final List<CrawlQuantitylValueEntity> values;
  @Enumerated(EnumType.name)
  SyncStatus status;

  CrawlQuantityEntity(
      {this.id,
      required this.dataUuid,
      this.featureId,
      this.attendanceId,
      required this.dataTimestamp,
      required this.values,
      this.status = SyncStatus.isNoSynced});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataUuid': dataUuid,
      'dataTimestamp': dataTimestamp.toUtc().toIso8601String(),
      'values': values.map((e) => e.toMap()).toList(),
    };
  }

  factory CrawlQuantityEntity.fromMap(Map<String, dynamic> map) {
    return CrawlQuantityEntity(
      id: map['id'] != null ? map['id'] as int : null,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
      values: List<CrawlQuantitylValueEntity>.from(
        (map['values'] as List<dynamic>).map<CrawlQuantitylValueEntity>(
          (x) => CrawlQuantitylValueEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CrawlQuantityEntity.fromJson(String source) =>
      CrawlQuantityEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  CrawlQuantityEntity copyWith({
    int? id,
    DateTime? dataTimestamp,
    String? dataUuid,
    List<CrawlQuantitylValueEntity>? values,
    int? featureId,
    int? attendanceId,
    SyncStatus? status,
  }) {
    return CrawlQuantityEntity(
      id: id ?? this.id,
      dataUuid: dataUuid ?? this.dataUuid,
      dataTimestamp: dataTimestamp ?? this.dataTimestamp,
      featureId: featureId ?? this.featureId,
      attendanceId: attendanceId ?? this.attendanceId,
      status: status ?? this.status,
      values: values ?? this.values,
    );
  }

  @override
  String toString() {
    return 'CrawlQuantityEntity(id: $id, dataUuid: $dataUuid, featureId: $featureId, attendanceId: $attendanceId, dataTimestamp: $dataTimestamp, values: $values, status: $status)';
  }
}

@embedded
class CrawlQuantitylValueEntity {
  int? id;
  int? featureQuantityId;
  int? value;

  CrawlQuantitylValueEntity({
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

  factory CrawlQuantitylValueEntity.fromMap(Map<String, dynamic> map) {
    return CrawlQuantitylValueEntity(
      id: map['id'] != null ? map['id'] as int : null,
      featureQuantityId: map['featureQuantityId'] != null
          ? map['featureQuantityId'] as int
          : null,
      value: map['value'] != null ? map['value'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CrawlQuantitylValueEntity.fromJson(String source) =>
      CrawlQuantitylValueEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CrwaQuantitylValueEntity(id: $id, featureQuantityId: $featureQuantityId, value: $value)';
}
