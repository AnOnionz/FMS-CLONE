import 'package:dio/dio.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utilities/parser.dart';
import '../../../images/data/datasource/images_remote_datasource.dart';
import '../../../statistic/domain/entities/employee_entity.dart';
import '../../domain/entities/bank_entity.dart';
import '../../domain/entities/profile_status_entity.dart';

abstract class IProfileRemoteDataSource {
  Future<EmployeeEntity?> getUserInfo();
  Future<void> createUserProfile(
      {required UserProfileEntity userProfile, required int projectId});
  Future<ProfileStatusEntity?> getProfileStatus();
  Future<void> markReadProfileStatus();
  Future<UserProfileEntity?> getUserProfile();
  Future<void> uploadFaceVerifyImage(XFile file);
  Future<List<Province>> getProvinces();
  Future<List<District>> getDistricts({required int provinceId});
  Future<List<Ward>> getWards(
      {required int provinceId, required int districtId});
  Future<List<BankEntity>> getBanks();
}

class ProfileRemoteDataSource extends ImagesRemoteDataSource
    implements IProfileRemoteDataSource {
  @override
  Future<EmployeeEntity?> getUserInfo() async {
    final _resp = await dio.get(path: '/app/user-info');
    final user = parseJson<EmployeeUserEntity>(
        (json: _resp, fromJson: EmployeeUserEntity.fromMap));
    if (user == null) return null;
    return EmployeeEntity(id: 51198, user: user);
  }

  @override
  Future<ProfileStatusEntity?> getProfileStatus() async {
    final _resp = await dio.get(path: '/app/user-profile/processing-status');
    final status = parseJson<ProfileStatusEntity>(
        (json: _resp, fromJson: ProfileStatusEntity.fromMap));
    return status;
  }

  @override
  Future<List<District>> getDistricts({required int provinceId}) async {
    final _resp =
        await dio.get(path: '/locations/provinces/$provinceId/districts');

    return parseListJson((listJson: _resp, fromJson: District.fromMap));
  }

  @override
  Future<List<Province>> getProvinces() async {
    final _resp = await dio.get(path: '/locations/provinces');

    return parseListJson((listJson: _resp, fromJson: Province.fromMap));
  }

  @override
  Future<List<Ward>> getWards(
      {required int provinceId, required int districtId}) async {
    final _resp = await dio.get(
        path: '/locations/provinces/$provinceId/districts/$districtId/wards');

    return parseListJson((listJson: _resp, fromJson: Ward.fromMap));
  }

  @override
  Future<List<BankEntity>> getBanks() async {
    final _resp = await dio.get(path: '/banks');

    return parseListJson((listJson: _resp, fromJson: BankEntity.fromMap));
  }

  @override
  Future<void> createUserProfile(
      {required UserProfileEntity userProfile, required int projectId}) async {
    final photos = [];

    await Future.forEach(userProfile.photos, (photo) async {
      if (photo.image == null) {
        final imageCloud = await uploadImageToServer(XFile(photo.localPath!));

        if (imageCloud != null) {
          photos.add(photo.toMap(imageCloud.id));
        }
      }
      if (photo.image != null) {
        photos.add(photo.toMap(photo.image!.id!));
      }
    });

    final _data = {
      ...userProfile.toMap(),
      ...{'photos': photos}
    };

    await dio.post(path: '/app/projects/$projectId/user-profile', data: _data);
  }

  @override
  Future<void> uploadFaceVerifyImage(XFile file) async {
    final FormData _formData = FormData.fromMap({
      'face': MultipartFile.fromBytes(await file.readAsBytes(),
          contentType: Headers.jsonMimeType
              .change(type: 'image', subtype: file.name.split('.').last),
          filename: file.name)
    });

    await dio.post(data: _formData, path: '/app/face-verification');
  }

  @override
  Future<UserProfileEntity?> getUserProfile() async {
    final _resp = await dio.get(path: '/app/user-profile');

    return parseJson((json: _resp, fromJson: UserProfileEntity.fromMap));
  }

  @override
  Future<void> markReadProfileStatus() async {
    await dio.post(path: '/app/user-profile/processing-status/mark-read');
  }
}
