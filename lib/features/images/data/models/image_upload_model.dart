import 'dart:convert';

class ImageUploadModel {
  final int id;
  final String uploadUrl;

  ImageUploadModel({
    required this.id,
    required this.uploadUrl,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageUploadModel.fromJson(String source) =>
      ImageUploadModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
