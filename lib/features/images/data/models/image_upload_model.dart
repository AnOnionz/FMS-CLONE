// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ImageUploadModel {
  final int id;
  final String uploadUrl;
  final AWSS3? s3;

  ImageUploadModel({
    required this.id,
    required this.uploadUrl,
    this.s3,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uploadUrl': uploadUrl,
      's3': s3?.toMap(),
    };
  }

  factory ImageUploadModel.fromMap(Map<String, dynamic> map) {
    return ImageUploadModel(
      id: map['id'] as int,
      uploadUrl: map['uploadUrl'] as String,
      s3: map['s3'] != null
          ? AWSS3.fromMap(map['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageUploadModel.fromJson(String source) =>
      ImageUploadModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ImageUploadModel(id: $id, uploadUrl: $uploadUrl, s3: $s3)';

  ImageUploadModel copyWith({
    int? id,
    String? uploadUrl,
    AWSS3? s3,
  }) {
    return ImageUploadModel(
      id: id ?? this.id,
      uploadUrl: uploadUrl ?? this.uploadUrl,
      s3: s3 ?? this.s3,
    );
  }

  @override
  bool operator ==(covariant ImageUploadModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.uploadUrl == uploadUrl && other.s3 == s3;
  }

  @override
  int get hashCode => id.hashCode ^ uploadUrl.hashCode ^ s3.hashCode;
}

class AWSS3 {
  final String? url;
  final Map<String, dynamic>? fields;

  AWSS3({
    this.url,
    this.fields,
  });

  AWSS3 copyWith({
    String? url,
    Map<String, dynamic>? fields,
  }) {
    return AWSS3(
      url: url ?? this.url,
      fields: fields ?? this.fields,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'fields': fields,
    };
  }

  factory AWSS3.fromMap(Map<String, dynamic> map) {
    return AWSS3(
      url: map['url'] != null ? map['url'] as String : null,
      fields:
          map['fields'] != null ? map['fields'] as Map<String, dynamic> : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AWSS3.fromJson(String source) =>
      AWSS3.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AWSS3(url: $url, fields: $fields)';

  @override
  bool operator ==(covariant AWSS3 other) {
    if (identical(this, other)) return true;

    return other.url == url && mapEquals(other.fields, fields);
  }

  @override
  int get hashCode => url.hashCode ^ fields.hashCode;
}
