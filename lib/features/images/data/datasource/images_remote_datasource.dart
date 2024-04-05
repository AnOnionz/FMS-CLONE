import 'package:dio/dio.dart';
import 'package:fms/core/client/dio_client.dart';
import 'package:fms/features/images/data/models/image_upload_model.dart';
// import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utilities/parser.dart';

abstract class ImagesRemoteDataSource {
  final DioClient dio;

  ImagesRemoteDataSource(this.dio);
  Future<ImageUploadModel?> uploadImageToServer(XFile file) async {
    final form = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        await file.readAsBytes(),
        filename: file.name,
      )
    });
    final _resp = await dio.post(path: '/images', data: form);
    return parseJson<ImageUploadModel>(
        (json: _resp, fromJson: ImageUploadModel.fromMap));
  }

  Future<void> uploadImageToCloud(XFile file,
      {required ImageUploadModel imageUploadModel}) async {
    final form = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        await file.readAsBytes(),
        filename: file.name,
      )
    });

    await dio.postHttp(path: imageUploadModel.uploadUrl, data: form);
  }
}
