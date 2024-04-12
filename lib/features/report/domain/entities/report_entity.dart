import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';

part 'report_entity.g.dart';

@collection
class ReportEntity {
  Id get isarId => fastHash(dataUuid);
  int? id;
  String dataUuid;
  String? path;
  DateTime dataTimestamp;
  int featurePhotoId;
  ImageCloud? image;
  @Enumerated(EnumType.name)
  SyncStatus status;

  ReportEntity(
      {this.id,
      required this.dataUuid,
      required this.dataTimestamp,
      required this.featurePhotoId,
      this.image,
      this.path,
      this.status = SyncStatus.synced});

  factory ReportEntity.fromMap(Map<String, dynamic> map) {
    return ReportEntity(
      id: map['id'] as int,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp: DateTime.parse(map['dataTimestamp'] as String),
      featurePhotoId: map['featurePhotoId'] as int,
      image: ImageCloud.fromMap(map['image'] as Map<String, dynamic>),
    );
  }

  factory ReportEntity.fromJson(String source) =>
      ReportEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
