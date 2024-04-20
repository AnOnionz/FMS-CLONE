// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/data_entity.dart';

part 'note_entity.g.dart';

@collection
class NoteEntity extends DataEnitity {
  Id get isarId => fastHash(dataUuid);
  int? id;
  final String dataUuid;
  @Index(type: IndexType.value)
  final DateTime dataTimestamp;
  final int featureMultimediaId;
  final photos = IsarLinks<PhotoEntity>();
  String? value;
  @Enumerated(EnumType.name)
  final SyncStatus status;

  NoteEntity(
      {this.id,
      required this.dataUuid,
      super.attendanceId,
      required this.dataTimestamp,
      super.featureId,
      required this.featureMultimediaId,
      this.value,
      this.status = SyncStatus.synced});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataUuid': dataUuid,
      'dataTimestamp': dataTimestamp.toUtc().toIso8601String(),
      'featureMultimediaId': featureMultimediaId,
      'value': value,
    };
  }

  factory NoteEntity.fromMap(Map<String, dynamic> map) {
    return NoteEntity(
      id: map['id'] as int,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
      featureMultimediaId: map['featureMultimediaId'] as int,
      value: map['featureMultimediaId'] as String?,
    );
  }

  factory NoteEntity.fromJson(String source) =>
      NoteEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  NoteEntity copyWith({
    int? id,
    int? attendanceId,
    int? featureId,
    String? dataUuid,
    DateTime? dataTimestamp,
    int? featureMultimediaId,
    String? value,
    SyncStatus? status,
  }) {
    return NoteEntity(
      id: id ?? this.id,
      attendanceId: attendanceId ?? this.attendanceId,
      dataUuid: dataUuid ?? this.dataUuid,
      dataTimestamp: dataTimestamp ?? this.dataTimestamp,
      featureId: featureId ?? this.featureId,
      featureMultimediaId: featureMultimediaId ?? this.featureMultimediaId,
      value: value ?? this.value,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'NoteEntity(id: $id, dataUuid: $dataUuid, attendanceId: $attendanceId, dataTimestamp: $dataTimestamp, featureId: $featureId, featureMultimediaId: $featureMultimediaId, value: $value, status: $status)';
  }
}
