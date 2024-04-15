// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';

import '../../../../core/utilities/parser.dart';

part 'report_entity.g.dart';

@collection
class PhotoEntity {
  Id get isarId => fastHash(dataUuid);
  int? id;
  String dataUuid;
  String? path;
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
      this.status = SyncStatus.synced});

  factory PhotoEntity.fromMap(Map<String, dynamic> map) {
    return PhotoEntity(
      id: map['id'] as int,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
      featurePhotoId: map['featurePhotoId'] as int,
      image: ImageCloud.fromMap(map['image'] as Map<String, dynamic>),
    );
  }

  factory PhotoEntity.fromJson(String source) =>
      PhotoEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhotoEntity(id: $id, dataUuid: $dataUuid, path: $path, dataTimestamp: $dataTimestamp, featurePhotoId: $featurePhotoId, image: $image, status: $status)';
  }

  PhotoEntity copyWith({
    int? id,
    String? dataUuid,
    String? path,
    DateTime? dataTimestamp,
    int? featurePhotoId,
    ImageCloud? image,
    SyncStatus? status,
  }) {
    return PhotoEntity(
      id: id ?? this.id,
      dataUuid: dataUuid ?? this.dataUuid,
      path: path ?? this.path,
      dataTimestamp: dataTimestamp ?? this.dataTimestamp,
      featurePhotoId: featurePhotoId ?? this.featurePhotoId,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }
}
