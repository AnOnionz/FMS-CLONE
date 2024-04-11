import 'dart:convert';

import 'package:isar/isar.dart';

part 'attendance_entity.g.dart';

@embedded
class AttendanceEntity {
  final int? id;
  final AttendanceData? dataIn;
  final AttendanceData? dataOut;

  AttendanceEntity({
    this.id,
    this.dataIn,
    this.dataOut,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'in': dataIn?.toMap(),
      'out': dataOut?.toMap(),
    };
  }

  factory AttendanceEntity.fromMap(Map<String, dynamic> map) {
    return AttendanceEntity(
      id: map['id'] as int,
      dataIn: map['in'] != null
          ? AttendanceData.fromMap(map['in'] as Map<String, dynamic>)
          : null,
      dataOut: map['out'] != null
          ? AttendanceData.fromMap(map['out'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceEntity.fromJson(String source) =>
      AttendanceEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AttendanceEntity(id: $id, in: $dataIn, out: $dataOut)';

  AttendanceEntity copyWith({
    int? id,
    AttendanceData? dataIn,
    AttendanceData? dataOut,
  }) {
    return AttendanceEntity(
      id: id ?? this.id,
      dataIn: dataIn ?? this.dataIn,
      dataOut: dataOut ?? this.dataOut,
    );
  }
}

@embedded
class AttendanceData {
  final ImageCloud? image;
  final double? latitude;
  final double? longitude;
  final String? deviceId;
  final DateTime? deviceTime;

  AttendanceData({
    this.image,
    this.latitude,
    this.longitude,
    this.deviceId,
    this.deviceTime,
  });

  @override
  String toString() {
    return 'AttendanceData(image: $image, latitude: $latitude, longitude: $longitude, deviceId: $deviceId, deviceTime: $deviceTime)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image?.toMap(),
      'latitude': latitude,
      'longitude': longitude,
      'deviceId': deviceId,
      'deviceTime': deviceTime,
    };
  }

  factory AttendanceData.fromMap(Map<String, dynamic> map) {
    return AttendanceData(
      image: map['image'] != null
          ? ImageCloud.fromMap(map['image'] as Map<String, dynamic>)
          : null,
      latitude: map['latitude'] != null
          ? double.tryParse(map['latitude'].toString())
          : null,
      longitude: map['longitude'] != null
          ? double.tryParse(map['longitude'].toString())
          : null,
      deviceId: map['deviceId'] != null ? map['deviceId'] as String : null,
      deviceTime: DateTime.parse(map['deviceTime'] as String).toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceData.fromJson(String source) =>
      AttendanceData.fromMap(json.decode(source) as Map<String, dynamic>);
}

@embedded
class ImageCloud {
  final int? id;
  final String? filename;
  final List<String>? variants;

  ImageCloud({
    this.id,
    this.filename,
    this.variants,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'filename': filename,
      'variants': variants,
    };
  }

  factory ImageCloud.fromMap(Map<String, dynamic> map) {
    return ImageCloud(
      id: map['id'] as int,
      filename: map['filename'] as String?,
      variants:
          (map['variants'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageCloud.fromJson(String source) =>
      ImageCloud.fromMap(json.decode(source) as Map<String, dynamic>);
}
