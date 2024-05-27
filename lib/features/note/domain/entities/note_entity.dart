import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/data_entity.dart';

part 'note_entity.g.dart';

@collection
class NoteEntity extends BaseEntity {
  Id get isarId => fastHash(keys.join('-'));
  int? id;
  String dataUuid;
  DateTime dataTimestamp;
  int? attendanceId;
  int? featureId;
  final int featureMultimediaId;
  final photos = IsarLinks<PhotoEntity>();
  String? value;
  bool isTextFieldRequired;
  @Enumerated(EnumType.name)
  final SyncStatus status;
  @Index(unique: true, replace: true)
  List<int> get keys => [attendanceId!, featureId!, featureMultimediaId];

  NoteEntity(
      {this.id,
      required this.dataUuid,
      this.attendanceId,
      required this.dataTimestamp,
      this.featureId,
      required this.featureMultimediaId,
      this.value,
      this.isTextFieldRequired = false,
      this.status = SyncStatus.isNoSynced});

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
      value: map['value'] as String?,
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
    bool? isTextFieldRequired,
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
      isTextFieldRequired: isTextFieldRequired ?? this.isTextFieldRequired,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'NoteEntity(id: $id, photos: $photos dataUuid: $dataUuid, dataTimestamp: $dataTimestamp, featureId: $featureId, attendanceId: $attendanceId, featureMultimediaId: $featureMultimediaId, value: $value, isTextFieldRequired: $isTextFieldRequired, status: $status)';
  }
}
