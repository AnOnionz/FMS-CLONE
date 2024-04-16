import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:isar/isar.dart';

import 'package:fms/core/utilities/parser.dart';

part 'crawl_quantity_entity.g.dart';

@collection
class CrwalQuantityEntity {
  Id get isarId => fastHash(createdTime.millisecondsSinceEpoch.toString());
  final int? id;
  final String dataUuid;
  final DateTime dataTimestamp;
  final DateTime createdTime;
  final List<CrwaQuantitylValueEntity> values;
  @Enumerated(EnumType.name)
  final SyncStatus status;

  CrwalQuantityEntity(
      {required this.id,
      required this.dataUuid,
      required this.dataTimestamp,
      required this.createdTime,
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
        createdTime: DateTime.parse(map['dataTimestamp'] as String).dMy(),
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
    String? dataUuid,
    DateTime? dataTimestamp,
    List<CrwaQuantitylValueEntity>? values,
  }) {
    return CrwalQuantityEntity(
        id: id ?? this.id,
        dataUuid: dataUuid ?? this.dataUuid,
        dataTimestamp: dataTimestamp ?? this.dataTimestamp,
        values: values ?? this.values,
        createdTime: createdTime);
  }

  @override
  String toString() {
    return 'CrwalQuantityEntity(id: $id, dataUuid: $dataUuid, dataTimestamp: $dataTimestamp, createdTime: $createdTime, values: $values)';
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
