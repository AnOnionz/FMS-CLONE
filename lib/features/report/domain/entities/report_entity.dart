// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fms/core/constant/enum.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:isar/isar.dart';

import '../../../../core/utilities/parser.dart';

part 'report_entity.g.dart';

@collection
class ReportEntity {
  Id get isarId => fastHash(dataUuid);
  final int? id;
  final String dataUuid;
  final List<int>? rawPath;
  final DateTime dataTimestamp;
  final int featurePhotoId;
  final ImageCloud? image;
  @Enumerated(EnumType.name)
  SyncStatus status;

  ReportEntity(
      {this.id,
      required this.dataUuid,
      required this.dataTimestamp,
      required this.featurePhotoId,
      this.image,
      this.rawPath,
      this.status = SyncStatus.noSynced});

  factory ReportEntity.fromMap(Map<String, dynamic> map) {
    return ReportEntity(
      id: map['id'] as int,
      dataUuid: map['dataUuid'] as String,
      dataTimestamp:
          DateTime.fromMillisecondsSinceEpoch(map['dataTimestamp'] as int),
      featurePhotoId: map['featurePhotoId'] as int,
      image: ImageCloud.fromMap(map['image'] as Map<String, dynamic>),
    );
  }

  factory ReportEntity.fromJson(String source) =>
      ReportEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
