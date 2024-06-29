import 'package:dio/dio.dart';
import 'package:fms/core/client/dio_client.dart';
import 'package:fms/features/images/data/models/image_upload_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utilities/parser.dart';

abstract class ImagesRemoteDataSource {
  final DioClient dio;

  ImagesRemoteDataSource(this.dio);

  Future<ImageUploadModel?> uploadImageToServer(XFile file,
      {bool withS3 = false}) async {
    final form = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        await file.readAsBytes(),
        filename: file.name,
      ),
      'withS3': withS3
    });

    final _resp = await dio.post(path: '/images', data: form);

    final imageUploadModel = parseJson<ImageUploadModel>(
        (json: _resp, fromJson: ImageUploadModel.fromMap));

    if (imageUploadModel != null) {
      final formCloudFlare = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          await file.readAsBytes(),
          filename: file.name,
        )
      });

      await dio.postHttp(
          path: imageUploadModel.uploadUrl, data: formCloudFlare);

      if (withS3 && imageUploadModel.s3Url != null) {
        final formS3 = FormData.fromMap({
          'file': MultipartFile.fromBytes(
            await file.readAsBytes(),
            filename: file.name,
            contentType: Headers.jsonMimeType
                .change(type: 'image', subtype: file.name.split('.').last),
          )
        });

        await dio.postHttp(path: imageUploadModel.s3Url!, data: formS3);
      }
    }
    return imageUploadModel;
  }
}
