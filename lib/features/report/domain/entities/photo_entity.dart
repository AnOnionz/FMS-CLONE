import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';
import '../../../general/domain/entities/data_entity.dart';

part 'photo_entity.g.dart';

@collection
class PhotoEntity extends DataEntity {
  Id get isarId => fastHash(dataUuid);
  int? id;
  String dataUuid;
  String? path;
  @Index(type: IndexType.value)
  DateTime dataTimestamp;
  int featurePhotoId;
  ImageCloud? image;
  @Enumerated(EnumType.name)
  SyncStatus status;

  PhotoEntity(
      {this.id,
      required this.dataUuid,
      required this.dataTimestamp,
      required this.featurePhotoId,
      this.image,
      this.path,
      this.status = SyncStatus.isNoSynced,
      super.attendanceId,
      super.featureId});

  factory PhotoEntity.fromMap(Map<String, dynamic> map) {
    return PhotoEntity(
      id: map['id'] as int,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
      featurePhotoId: map['featurePhotoId'] != null
          ? map['featurePhotoId'] as int
          : map['featureMultimediaId'] as int,
      image: ImageCloud.fromMap(map['image'] as Map<String, dynamic>),
    );
  }

  factory PhotoEntity.fromJson(String source) =>
      PhotoEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  PhotoEntity copyWith({
    int? id,
    int? attendanceId,
    int? featureId,
    String? dataUuid,
    String? path,
    DateTime? dataTimestamp,
    int? featurePhotoId,
    ImageCloud? image,
    SyncStatus? status,
  }) {
    return PhotoEntity(
      id: id ?? this.id,
      attendanceId: attendanceId ?? this.attendanceId,
      dataUuid: dataUuid ?? this.dataUuid,
      path: path ?? this.path,
      dataTimestamp: dataTimestamp ?? this.dataTimestamp,
      featureId: featureId ?? this.featureId,
      featurePhotoId: featurePhotoId ?? this.featurePhotoId,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'PhotoEntity(id: $id, dataUuid: $dataUuid, status: $status)';
  }
}
