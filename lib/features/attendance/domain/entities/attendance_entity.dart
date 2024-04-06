import 'dart:convert';

class AttendanceEntity {
  final int id;
  final AttendanceData dataIn;
  final AttendanceData dataOut;

  AttendanceEntity({
    required this.id,
    required this.dataIn,
    required this.dataOut,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dataIn': dataIn.toMap(),
      'dataOut': dataOut.toMap(),
    };
  }

  factory AttendanceEntity.fromMap(Map<String, dynamic> map) {
    return AttendanceEntity(
      id: map['id'] as int,
      dataIn: AttendanceData.fromMap(map['dataIn'] as Map<String, dynamic>),
      dataOut: AttendanceData.fromMap(map['dataOut'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceEntity.fromJson(String source) =>
      AttendanceEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AttendanceData {
  final ImageCloud image;
  final double latitude;
  final double longitude;
  final String deviceId;
  final String deviceTime;

  AttendanceData({
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.deviceId,
    required this.deviceTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image.toMap(),
      'latitude': latitude,
      'longitude': longitude,
      'deviceId': deviceId,
      'deviceTime': deviceTime,
    };
  }

  factory AttendanceData.fromMap(Map<String, dynamic> map) {
    return AttendanceData(
      image: ImageCloud.fromMap(map['image'] as Map<String, dynamic>),
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      deviceId: map['deviceId'] as String,
      deviceTime: map['deviceTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceData.fromJson(String source) =>
      AttendanceData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ImageCloud {
  final int id;
  final String expiresAt;
  final String uploadUrl;
  final String filename;

  ImageCloud({
    required this.id,
    required this.expiresAt,
    required this.uploadUrl,
    required this.filename,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'expiresAt': expiresAt,
      'uploadUrl': uploadUrl,
      'filename': filename,
    };
  }

  factory ImageCloud.fromMap(Map<String, dynamic> map) {
    return ImageCloud(
      id: map['id'] as int,
      expiresAt: map['expiresAt'] as String,
      uploadUrl: map['uploadUrl'] as String,
      filename: map['filename'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageCloud.fromJson(String source) =>
      ImageCloud.fromMap(json.decode(source) as Map<String, dynamic>);
}
