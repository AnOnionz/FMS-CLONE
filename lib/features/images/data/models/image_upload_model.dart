// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageUploadModel {
  final int id;
  final String uploadUrl;
  final String? s3Url;

  ImageUploadModel({
    required this.id,
    required this.uploadUrl,
    this.s3Url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uploadUrl': uploadUrl,
    };
  }

  factory ImageUploadModel.fromMap(Map<String, dynamic> map) {
    return ImageUploadModel(
        id: map['id'] as int,
        uploadUrl: map['uploadUrl'] as String,
        s3Url: map['s3'] != null
            ? (map['s3'] as Map<String, dynamic>)['signedUrl'] as String?
            : null);
  }

  String toJson() => json.encode(toMap());

  factory ImageUploadModel.fromJson(String source) =>
      ImageUploadModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ImageUploadModel(id: $id, uploadUrl: $uploadUrl, s3Url: $s3Url)';
}
