import 'package:equatable/equatable.dart';

import '../../../attendance/domain/entities/attendance_entity.dart';

class ImageDynamic extends Equatable {
  final int? id;
  final String uuid;
  final String? noteUuid;
  final DateTime dataTimestamp;
  final String? path;
  final ImageCloud? networkImage;

  ImageDynamic(
      {this.id,
      required this.uuid,
      this.noteUuid,
      required this.dataTimestamp,
      this.path,
      this.networkImage});

  @override
  List<Object?> get props => [uuid];
}
